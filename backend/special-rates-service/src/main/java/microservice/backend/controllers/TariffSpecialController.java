package microservice.backend.controllers;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.PrecioDTO;
import microservice.backend.dto.TarifaDTO;
import microservice.backend.entities.TariffSpecial;
import microservice.backend.services.TariffSpecialService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/specialtariffs")
@RequiredArgsConstructor
public class TariffSpecialController {

    private final TariffSpecialService tariffSpecialService;

    @GetMapping("/")
    public TariffSpecial obtenerTarifaEspecial() {
        return tariffSpecialService.getTariffSpecial();
    }

    @PostMapping("/crear")
    public void crear(TarifaDTO tarifaDTO) {
        tariffSpecialService.saveTariffSpecial(tarifaDTO);
    }

    @PostMapping("/actualizar")
    public void actualizar(TarifaDTO tarifaDTO) {
        tariffSpecialService.updateTariffSpecial(tarifaDTO);
    }

    @PostMapping("/obtenerprice")
    public double obtenerPrecio(@RequestBody PrecioDTO precioDTO) {
        return tariffSpecialService.getPrice(precioDTO.getFecha(), precioDTO.getPrecioRegular());
    }
}
