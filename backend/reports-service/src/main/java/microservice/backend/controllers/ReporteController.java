package microservice.backend.controllers;

import lombok.RequiredArgsConstructor;
import microservice.backend.services.ReporteService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;

@RestController
@RequestMapping("/reportes")
@RequiredArgsConstructor
public class ReporteController {

    private final ReporteService reporteService;

    @GetMapping("/report/tariff")
    @Cacheable(value = "tariffReports", key = "#startDate + '_' + #endDate", unless = "#result == null")
    public ResponseEntity<byte[]> generateTariffReport(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        try {
            byte[] report = reporteService.generateTariffReport(startDate, endDate);

            return ResponseEntity.ok()
                    .header("Content-Disposition", "attachment; filename=reporte_tarifas.xlsx")
                    .header("Cache-Control", "public, max-age=3600") // RF8 Optimization: Browser caching
                    .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .contentLength(report.length)
                    .body(report);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/report/group-size")
    @Cacheable(value = "groupSizeReports", key = "#startDate + '_' + #endDate", unless = "#result == null")
    public ResponseEntity<byte[]> generateGroupSizeReport(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        try {
            byte[] report = reporteService.generateGroupSizeReport(startDate, endDate);

            return ResponseEntity.ok()
                    .header("Content-Disposition", "attachment; filename=reporte_tamanio_grupo.xlsx")
                    .header("Cache-Control", "public, max-age=3600") // RF8 Optimization: Browser caching
                    .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .contentLength(report.length)
                    .body(report);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
