package microservice.backend.controllers;


import lombok.RequiredArgsConstructor;
import microservice.backend.entities.SpecialDayEntity;
import microservice.backend.services.SpecialDayService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/specialtariffs/specialdays")
@RequiredArgsConstructor
public class SpecialDayController {

    private final SpecialDayService specialDayService;

    @GetMapping("/")
    public ResponseEntity<List<SpecialDayEntity>> getAllSpecialDays() {
        List<SpecialDayEntity> specialDays = specialDayService.getSpecialDays();
        return ResponseEntity.ok(specialDays);
    }

    @PostMapping("/")
    public ResponseEntity<SpecialDayEntity> createSpecialDay(@RequestBody SpecialDayEntity specialDay) {
        SpecialDayEntity createdSpecialDay = specialDayService.saveSpecialDay(specialDay);
        return ResponseEntity.ok(createdSpecialDay);
    }

    @GetMapping("/{id}")
    public ResponseEntity<SpecialDayEntity> getSpecialDayById(@PathVariable Long id) {
        SpecialDayEntity specialDay = specialDayService.getSpecialDayById(id);
        return ResponseEntity.ok(specialDay);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> deleteSpecialDayById(@PathVariable Long id) throws Exception {
        boolean delete = specialDayService.deleteSpecialDayByID(id);
        return ResponseEntity.ok(delete);
    }

}
