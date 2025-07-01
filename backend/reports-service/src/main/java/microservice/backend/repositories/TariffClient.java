package microservice.backend.repositories;

import microservice.backend.dto.TariffBasicIdDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Repository
@FeignClient(name = "tariff-service")
public interface TariffClient {

    @GetMapping("/tariffs/getAll")
    List<TariffBasicIdDTO> getAllTariffs();
}
