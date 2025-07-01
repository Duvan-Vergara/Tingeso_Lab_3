package microservice.backend.services;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import lombok.RequiredArgsConstructor;
import microservice.backend.dto.*;
import microservice.backend.entities.ReserveEntity;
import microservice.backend.entities.UserEntity;
import microservice.backend.repositories.DescPersonaClient;
import microservice.backend.repositories.DesctPersonaFrect;
import microservice.backend.repositories.ReserveRepository;
import microservice.backend.repositories.TariffClient;
import microservice.backend.utils.ComplementReserve;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.itextpdf.text.Document;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.util.ByteArrayDataSource;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@RequiredArgsConstructor
public class ReserveService {

    private final ReserveRepository reserveRepository;

    private final TariffClient tariffClient;

    private final DescPersonaClient descPersonaClient;

    private final DesctPersonaFrect desctPersonaFrect;

    private final JavaMailSender javaMailSender;

    private final ComplementReserve complementReserve;


    @Value("${spring.mail.username}")
    private String senderEmail;

    private static final String PAYMENT_RECEIPT_SUBJECT = "Comprobante de Pago";

    private static final Logger logger = LoggerFactory.getLogger(ReserveService.class);

    public List<ReserveEntity> getReserves() {
        return new ArrayList<>(reserveRepository.findAll());
    }

    public ReserveEntity saveReserve(ReserveEntity reserve) {
        if (reserve.getTariffId() == null) {

            long durationInMinutes = java.time.Duration.between(reserve.getBegin(), reserve.getFinish()).toMinutes();
            TiempoDTO tiempoDTO = new TiempoDTO(durationInMinutes);
            MaxMinutesIdDTO calculatedTariff = tariffClient.getBestTariffId(tiempoDTO);

            reserve.setTariffId(calculatedTariff.getId());
            reserve.setFinish(reserve.getBegin().plusMinutes(calculatedTariff.getMaxMinutes()));
            reserve.setFinalPrice(calculateFinalPrice(reserve, reserve.getReserveday().getMonthValue()));
        }
        // Guardar la reserva
        return reserveRepository.save(reserve);
    }

    public ReserveEntity getReserveById(Long id) {
        return reserveRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Reserva no encontrada con id: " + id));
    }

    public List<ReserveDTO> getReserveByWeek(int year, int month, int day) {
        LocalDate date = LocalDate.of(year, month, day);
        LocalDate startDate = date.with(TemporalAdjusters.previousOrSame(java.time.DayOfWeek.MONDAY));
        LocalDate endDate = startDate.plusDays(6);

        // Obtener reservas entre las fechas
        List<ReserveEntity> reserves = reserveRepository.getReserveByDate_DateBetween(startDate, endDate);

        // Mapear a DTO
        return reserves.stream()
                .map(r -> {
                    String username = r.getReservesUsers().isEmpty() ? "" : r.getReservesUsers().iterator().next().getName();
                    return new ReserveDTO(r.getReserveday(), r.getBegin(), r.getFinish(), username);
                })
                .collect(Collectors.toList());
    }

    public List<ReserveBasicDTO> getReservesByDateBetween(LocalDate startDate, LocalDate endDate) {
        List<ReserveEntity> reserves = reserveRepository.getReserveByDate_DateBetween(startDate, endDate);
        return reserves.stream()
                .map(r -> new ReserveBasicDTO(
                        r.getReserveday(),
                        r.getTariffId(),
                        r.getFinalPrice(),
                        r.getReservesUsers().size()
                ))
                .toList();
    }

    public boolean deleteReserveById(Long id) throws Exception {
        try {
            reserveRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            throw new ReserveServiceExeption("Error al eliminar la reserva: " + id, e);
        }
    }

    public static class ReserveServiceExeption extends RuntimeException {
        public ReserveServiceExeption(String message, Throwable cause) {
            super(message, cause);
        }
    }

    public double calculateFinalPrice(ReserveEntity reserve, int month) {
        double totalPrice = 0;
        int birthdayLimit = complementReserve.calculateBirthdayLimit(reserve.getReservesUsers().size());

        FechaDTO fechaDTO = new FechaDTO(reserve.getReserveday(), reserve.getTariffId());
        double basePrice = tariffClient.getBasePrice(fechaDTO);
        double groupDiscount = Optional.ofNullable(
                descPersonaClient.obtenerDescuento(new PersonaDTO(reserve.getReservesUsers().size())).getBody()
        ).orElse(0.0);

        // Calcular el descuento por grupo
        for (UserEntity user : reserve.getReservesUsers()) {
            double userFrectDiscount = getFrequentDiscount(user, month);
            double birthdayDiscount = (complementReserve.isBirthday(user, reserve.getReserveday()) && birthdayLimit > 0) ? 0.50 : 0.0;
            if (birthdayDiscount > 0) birthdayLimit--;

            double bestDiscount = Math.max(groupDiscount, userFrectDiscount);
            bestDiscount = Math.max(bestDiscount, birthdayDiscount);

            // Aplicar el descuento al precio base por usuario
            totalPrice += basePrice * (1 - bestDiscount);
        }

        return totalPrice;
    }

    // Fragmento duplicado extraído para obtener descuento frecuente
    private double getFrequentDiscount(UserEntity user, int month) {
        List<ReserveEntity> userReserves = reserveRepository.getReservesByDateMonthAndRut(user.getRut(), month);
        return Optional.ofNullable(
                desctPersonaFrect.obtenerDescuento(new VecesDTO(userReserves.size())).getBody()
        ).orElse(0.0);
    }

    public byte[] generatePaymentReceipt(ReserveEntity reserve) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet(PAYMENT_RECEIPT_SUBJECT);

        // Encabezados generales
        Row headerRow = sheet.createRow(0);
        String[] headers = {
                "Código de Reserva", "Fecha y Hora de Reserva", "Número de Vueltas/Max Tiempo",
                "Cantidad de Personas", "Nombre de la Persona que Reservó", "", ""
        };
        for (int i = 0; i < headers.length; i++) {
            headerRow.createCell(i).setCellValue(headers[i]);
        }

        // Obtener datos de la tarifa usando el ID
        TariffBasicDTO tariff = tariffClient.getTariffById(new IdDTO(reserve.getTariffId())).getBody();
        double basePrice = tariffClient.getBasePrice(new FechaDTO(reserve.getReserveday(), reserve.getTariffId()));

        // Información de la reserva
        Row infoRow = sheet.createRow(1);
        infoRow.createCell(0).setCellValue(reserve.getId());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM HH:mm");
        LocalDateTime dateTime = LocalDateTime.of(reserve.getReserveday(), reserve.getBegin());
        infoRow.createCell(1).setCellValue(dateTime.format(formatter));
        // Manejo de posible NullPointerException en getLaps()
        String lapsInfo = (tariff != null) ? (tariff.getLaps() + " vueltas / " + tariff.getMaxMinutes() + " minutos") : "N/A";
        infoRow.createCell(2).setCellValue(lapsInfo);
        infoRow.createCell(3).setCellValue(reserve.getReservesUsers().size());
        infoRow.createCell(4).setCellValue(reserve.getReservesUsers().iterator().next().getName());
        for (int i = 5; i < 7; i++) infoRow.createCell(i);

        // Encabezados detalle de pago
        Row paymentHeaderRow = sheet.createRow(3);
        String[] paymentHeaders = {
                "Nombre de Cliente", "Tarifa Base", "Descuento(%)", 
                "Descuento Aplicado (%)", "Monto Final", "IVA", "Monto Total"
        };
        for (int i = 0; i < paymentHeaders.length; i++) {
            paymentHeaderRow.createCell(i).setCellValue(paymentHeaders[i]);
        }

        // Detalle de pago por usuario
        int rowNum = 4;
        double totalAmount = 0;
        double iva = 0;
        int birthdayLimit = complementReserve.calculateBirthdayLimit(reserve.getReservesUsers().size());
        // Manejo de posible NullPointerException en obtenerDescuento().getBody()
        Double groupDiscountObj = descPersonaClient.obtenerDescuento(new PersonaDTO(reserve.getReservesUsers().size())).getBody();
        double groupDiscount = groupDiscountObj != null ? groupDiscountObj : 0.0;

        for (UserEntity user : reserve.getReservesUsers()) {
            Row row = sheet.createRow(rowNum++);

            List<ReserveEntity> userReserves = reserveRepository.getReservesByDateMonthAndRut(user.getRut(), reserve.getReserveday().getMonthValue());
            // Manejo de posible NullPointerException en obtenerDescuento().getBody()
            Double frequentDiscountObj = desctPersonaFrect.obtenerDescuento(new VecesDTO(userReserves.size())).getBody();
            double frequentDiscount = frequentDiscountObj != null ? frequentDiscountObj : 0.0;
            double birthdayDiscount = (complementReserve.isBirthday(user, reserve.getReserveday()) && birthdayLimit > 0) ? 0.50 : 0.0;

            if (birthdayDiscount > 0) birthdayLimit--;

            // Selección del mejor descuento
            double bestDiscount = Math.max(groupDiscount, frequentDiscount);
            bestDiscount = Math.max(bestDiscount, birthdayDiscount);

            double finalAmount = basePrice * (1 - bestDiscount);
            double ivaAmount = finalAmount * 0.19;
            double totalWithIva = finalAmount + ivaAmount;

            row.createCell(0).setCellValue(user.getName());
            row.createCell(1).setCellValue(basePrice);
            row.createCell(2).setCellValue(groupDiscount * 100);
            row.createCell(3).setCellValue(bestDiscount * 100);
            row.createCell(4).setCellValue(finalAmount);
            row.createCell(5).setCellValue(ivaAmount);
            row.createCell(6).setCellValue(totalWithIva);

            totalAmount += finalAmount;
            iva += ivaAmount;
        }

        // Totales
        Row totalReserveRow = sheet.createRow(rowNum);
        for (int i = 0; i < 4; i++) totalReserveRow.createCell(i);
        totalReserveRow.createCell(4).setCellValue("Totales:");
        totalReserveRow.createCell(5).setCellValue(iva);
        totalReserveRow.createCell(6).setCellValue(totalAmount + iva);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        workbook.close();
        return bos.toByteArray();
    }

    public byte[] convertExcelToPdf(byte[] excelData) throws IOException, DocumentException {
        ByteArrayInputStream bis = new ByteArrayInputStream(excelData);

        Document document = new Document();
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, bos);
        document.open();

        try (Workbook workbook = WorkbookFactory.create(bis)) { // try-with-resources para Workbook
            Sheet sheet = workbook.getSheetAt(0);

            // Crear una tabla en el PDF con el número de columnas del Excel
            int numberOfColumns = sheet.getRow(0).getLastCellNum();
            com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(numberOfColumns);
            table.setWidthPercentage(100); // Ajustar al ancho de la página

            // Establecer anchos relativos para las columnas
            float[] columnWidths = new float[numberOfColumns];
            Arrays.fill(columnWidths, 1f); // Asignar ancho uniforme a todas las columnas
            table.setWidths(columnWidths);

            // Agregar encabezados de la tabla
            Row headerRow = sheet.getRow(0);
            for (Cell cell : headerRow) {
                table.addCell(new com.itextpdf.text.Phrase(cell.toString()));
            }

            // Agregar datos de las filas
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                if (row != null) {
                    // Determinar el número de columnas dinámicamente para cada fila
                    int dynamicNumberOfColumns = row.getLastCellNum();
                    for (int j = 0; j < dynamicNumberOfColumns; j++) {
                        Cell cell = row.getCell(j, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                        // Formatear valores numéricos para mayor claridad
                        if (cell.getCellType() == CellType.NUMERIC) {
                            table.addCell(new com.itextpdf.text.Phrase(String.format("%.2f", cell.getNumericCellValue())));
                        } else {
                            table.addCell(new com.itextpdf.text.Phrase(cell.toString()));
                        }
                    }
                }
            }
            // Agregar la tabla al documento PDF
            document.add(table);
        }
        document.close();
        return bos.toByteArray();
    }

    public void sendEmailWithAttachment(String to, String subject, String text, byte[] attachmentData, String attachmentName) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            message.setSubject(subject);
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(senderEmail);
            helper.setTo(to);
            helper.setText(text);
            helper.addAttachment(attachmentName, new ByteArrayDataSource(attachmentData, "application/pdf"));
            javaMailSender.send(message);
        } catch (MessagingException e) {
            // Reemplazar printStackTrace por logging robusto
            org.slf4j.LoggerFactory.getLogger(ReserveService.class).error("Error enviando correo electrónico", e);
        }
    }

    public void sendPaymentReceipts(ReserveEntity reserve) throws IOException, DocumentException {
        byte[] excelData = generatePaymentReceipt(reserve);
        byte[] pdfData = convertExcelToPdf(excelData);

        for (UserEntity user : reserve.getReservesUsers()) {
            sendEmailWithAttachment(
                    user.getEmail(),
                    PAYMENT_RECEIPT_SUBJECT,
                    "Adjunto encontrará el comprobante de pago de su reserva.",
                    pdfData,
                    "Comprobante_de_Pago.pdf"
            );
        }
    }

    public void sendPaymentReceiptsNew(ReserveEntity reserve) throws IOException, DocumentException {
        byte[] excelData = generatePaymentReceipt(reserve);
        byte[] pdfData = convertExcelToPdf(excelData);

        ExecutorService executorService = Executors.newFixedThreadPool(5);

        for (UserEntity user : reserve.getReservesUsers()) {
            executorService.submit(() -> {
                try {
                    sendEmailWithAttachment(
                            user.getEmail(),
                            PAYMENT_RECEIPT_SUBJECT,
                            "Adjunto encontrará el comprobante de pago de su reserva.",
                            pdfData,
                            "Comprobante_de_Pago.pdf"
                    );
                } catch (Exception e) {
                    logger.error("Error enviando comprobante de pago al usuario: {}", user.getEmail(), e); // línea 356
                }
            });
        }
        executorService.shutdown();
        try {
            if (!executorService.awaitTermination(60, TimeUnit.SECONDS)) {
                logger.warn("Algunas tareas no se completaron a tiempo."); // línea 364
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt(); // línea 366
            logger.error("El hilo fue interrumpido mientras esperaba la terminación del pool de hilos.", e); // línea 367
        }
    }

}
