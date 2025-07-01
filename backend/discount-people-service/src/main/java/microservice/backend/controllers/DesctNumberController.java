package microservice.backend.controllers;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.DesctDTO;
import microservice.backend.dto.PersonaDTO;
import microservice.backend.entities.DesctNumberEntity;
import microservice.backend.services.DesctNumberService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/desctnumber")
@RequiredArgsConstructor
public class DesctNumberController {

    private final DesctNumberService desctNumberService;

    @GetMapping("/")
    public List<DesctNumberEntity> obtenerDescuentos() {
        return desctNumberService.obtenerTodos();
    }

    @PostMapping("/obtener-descuento")
    public ResponseEntity<Double> obtenerDescuento(@RequestBody PersonaDTO personaDTO) {
        double descuento = desctNumberService.obtenerDescuento(personaDTO.getPersonas());
        return ResponseEntity.ok(descuento);
    }

    @PostMapping("/crear")
    public ResponseEntity<Void> crearDescuento(@RequestBody DesctDTO desctDTO) {
        desctNumberService.guardar(desctDTO);
        return ResponseEntity.ok().build();
    }

}