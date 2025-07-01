package microservice.backend.repositories;

import microservice.backend.dto.VecesDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
@FeignClient(name = "discount-frequent-service")
public interface DesctPersonaFrect {

    @PostMapping("/desctfrecu/obtener-descuento")
    ResponseEntity<Double> obtenerDescuento(@RequestBody VecesDTO vecesDTO);

}
