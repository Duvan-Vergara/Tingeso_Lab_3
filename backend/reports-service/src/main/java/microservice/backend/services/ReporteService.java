package microservice.backend.services;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.DesctNumberDTO;
import microservice.backend.dto.ReserveBasicDTO;
import microservice.backend.dto.StarEndDTO;
import microservice.backend.dto.TariffBasicIdDTO;
import microservice.backend.repositories.ReserveClient;
import microservice.backend.repositories.TariffClient;
import org.springframework.stereotype.Service;
import microservice.backend.repositories.DesctNumberClient;

import java.io.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@Service
@RequiredArgsConstructor
public class ReporteService {

    private final TariffClient tariffClient;

    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(ReporteService.class);

    private final ReserveClient reserveClient;

    private final DesctNumberClient desctNumberClient;

    private static final String TOTAL_LABEL = "TOTAL";


    private List<YearMonth> getMonthsBetween(LocalDate startDate, LocalDate endDate) {
        List<YearMonth> months = new ArrayList<>();
        YearMonth start = YearMonth.from(startDate);
        YearMonth end = YearMonth.from(endDate);

        while (!start.isAfter(end)) {
            months.add(start);
            start = start.plusMonths(1);
        }
        return months;
    }

    private String formatMonth(YearMonth month) {
        return month.format(DateTimeFormatter.ofPattern("MMMM", new Locale("es", "ES"))).toUpperCase();
    }

    private double calculateIncome(List<ReserveBasicDTO> reserves, TariffBasicIdDTO tariff, YearMonth month) {
        return reserves.stream()
                .filter(r -> {
                    YearMonth reserveMonth = YearMonth.from(r.getReserveday());
                    return reserveMonth.equals(month) &&
                            tariff.getId() == r.getTariffId();
                })
                .mapToDouble(ReserveBasicDTO::getFinalPrice)
                .sum();
    }

    private double calculateGroupSizeIncome(List<ReserveBasicDTO> reserves, int minSize, int maxSize, YearMonth month) {
        return reserves.stream()
                .filter(r -> {
                    YearMonth reserveMonth = YearMonth.from(r.getReserveday());
                    int groupSize = r.getGroupSize();
                    return reserveMonth.equals(month) &&
                            groupSize >= minSize && groupSize <= maxSize;
                })
                .mapToDouble(ReserveBasicDTO::getFinalPrice)
                .sum();
    }

    private CellStyle createHeaderStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return style;
    }

    private CellStyle createMoneyStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        DataFormat format = workbook.createDataFormat();
        style.setDataFormat(format.getFormat("#,##0"));
        style.setAlignment(HorizontalAlignment.RIGHT);
        return style;
    }

    private void createHeaderRow(Sheet sheet, CellStyle headerStyle, List<YearMonth> months, String firstColumnLabel) {
        Row headerRow = sheet.createRow(0);
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue(firstColumnLabel);
        headerCell.setCellStyle(headerStyle);

        for (int i = 0; i < months.size(); i++) {
            Cell monthCell = headerRow.createCell(i + 1);
            monthCell.setCellValue(formatMonth(months.get(i)));
            monthCell.setCellStyle(headerStyle);
        }

        Cell totalHeaderCell = headerRow.createCell(months.size() + 1);
        totalHeaderCell.setCellValue(TOTAL_LABEL);
        totalHeaderCell.setCellStyle(headerStyle);
    }

    private void createTotalRow(Sheet sheet, int rowIndex, CellStyle headerStyle, CellStyle moneyStyle, double[] columnTotals, int monthsSize) {
        Row totalRow = sheet.createRow(rowIndex);
        Cell totalLabelCell = totalRow.createCell(0);
        totalLabelCell.setCellValue(TOTAL_LABEL);
        totalLabelCell.setCellStyle(headerStyle);

        for (int i = 0; i <= monthsSize; i++) {
            Cell totalCell = totalRow.createCell(i + 1);
            totalCell.setCellValue(columnTotals[i]);
            totalCell.setCellStyle(moneyStyle);
        }
    }

    private void autoSizeColumns(Sheet sheet, int columns) {
        for (int i = 0; i <= columns; i++) {
            sheet.autoSizeColumn(i);
        }
    }

    public byte[] generateTariffReport(LocalDate startDate, LocalDate endDate) throws IOException {

        if (startDate.isAfter(endDate)) {
            throw new IllegalArgumentException("La fecha de inicio no puede ser posterior a la fecha fin.");
        }

        List<TariffBasicIdDTO> tariffs = tariffClient.getAllTariffs();
        if (tariffs.isEmpty()) {
            throw new IllegalArgumentException("No existen tarifas registradas");
        }

        logger.info("Se encontraron {} tarifas para procesar.", tariffs.size());

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Reporte por Tarifas");
            CellStyle headerStyle = createHeaderStyle(workbook);
            CellStyle moneyStyle = createMoneyStyle(workbook);

            List<YearMonth> months = getMonthsBetween(startDate, endDate);
            createHeaderRow(sheet, headerStyle, months, "Número de vueltas o tiempo máximo permitido");

            List<ReserveBasicDTO> allReserves = reserveClient.getAll(new StarEndDTO(startDate, endDate.plusDays(1)));

            int rowIndex = 1;
            double[] columnTotals = new double[months.size() + 1]; // +1 para el total general

            for (TariffBasicIdDTO tariff : tariffs) {
                Row dataRow = sheet.createRow(rowIndex++);
                dataRow.createCell(0).setCellValue(
                        tariff.getLaps() + " vueltas o máx " + tariff.getMaxMinutes() + " min");

                double rowTotal = 0;

                for (int i = 0; i < months.size(); i++) {
                    YearMonth month = months.get(i);
                    double monthlyIncome = calculateIncome(allReserves, tariff, month);

                    Cell valueCell = dataRow.createCell(i + 1);
                    valueCell.setCellValue(monthlyIncome);
                    valueCell.setCellStyle(moneyStyle);

                    rowTotal += monthlyIncome;
                    columnTotals[i] += monthlyIncome;
                }

                Cell rowTotalCell = dataRow.createCell(months.size() + 1);
                rowTotalCell.setCellValue(rowTotal);
                rowTotalCell.setCellStyle(moneyStyle);
                columnTotals[months.size()] += rowTotal;
            }

            createTotalRow(sheet, rowIndex, headerStyle, moneyStyle, columnTotals, months.size());

            autoSizeColumns(sheet, months.size() + 1);

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            workbook.write(bos);
            return bos.toByteArray();
        }
    }

    public byte[] generateGroupSizeReport(LocalDate startDate, LocalDate endDate) throws IOException {
        if (startDate.isAfter(endDate)) {
            throw new IllegalArgumentException("La fecha de inicio no puede ser posterior a la fecha fin.");
        }

        List<DesctNumberDTO> categories = desctNumberClient.getAllDesctNumbers();
        if (categories.isEmpty()) {
            throw new IllegalArgumentException("No se encontraron categorías de descuentos por número de personas.");
        }

        int[][] groupSizeCategories = new int[categories.size()][2];
        String[] categoryLabels = new String[categories.size()];


        for (int i = 0; i < categories.size(); i++) {
            DesctNumberDTO category = categories.get(i);
            groupSizeCategories[i][0] = category.getMinpersonas();
            groupSizeCategories[i][1] = category.getMaxpersonas();
            categoryLabels[i] = category.getMinpersonas() + "-" + category.getMaxpersonas() + " personas";
        }

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Reporte por Tamaño de Grupo");
            CellStyle headerStyle = createHeaderStyle(workbook);
            CellStyle moneyStyle = createMoneyStyle(workbook);

            List<YearMonth> months = getMonthsBetween(startDate, endDate);
            createHeaderRow(sheet, headerStyle, months, "Número de personas");

            List<ReserveBasicDTO> allReserves = reserveClient.getAll(new StarEndDTO(startDate, endDate.plusDays(1)));

            int rowIndex = 1;
            double[] columnTotals = new double[months.size() + 1];

            for (int i = 0; i < groupSizeCategories.length; i++) {
                int[] range = groupSizeCategories[i];
                String label = categoryLabels[i];

                Row dataRow = sheet.createRow(rowIndex++);
                dataRow.createCell(0).setCellValue(label);

                double rowTotal = 0;

                for (int j = 0; j < months.size(); j++) {
                    YearMonth month = months.get(j);
                    double monthlyIncome = calculateGroupSizeIncome(allReserves, range[0], range[1], month);

                    Cell valueCell = dataRow.createCell(j + 1);
                    valueCell.setCellValue(monthlyIncome);
                    valueCell.setCellStyle(moneyStyle);

                    rowTotal += monthlyIncome;
                    columnTotals[j] += monthlyIncome;
                }

                Cell rowTotalCell = dataRow.createCell(months.size() + 1);
                rowTotalCell.setCellValue(rowTotal);
                rowTotalCell.setCellStyle(moneyStyle);
                columnTotals[months.size()] += rowTotal;
            }

            createTotalRow(sheet, rowIndex, headerStyle, moneyStyle, columnTotals, months.size());

            autoSizeColumns(sheet, months.size() + 1);

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            workbook.write(bos);
            return bos.toByteArray();
        }
    }
}