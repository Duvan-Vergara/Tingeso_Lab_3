package microservice.backend.repositories;

import microservice.backend.dto.*;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
@FeignClient(name = "tariff-service")
public interface TariffClient {

    @PostMapping("/tariffs/baseprice")
    double getBasePrice(@RequestBody FechaDTO fecha);

    @PostMapping("/tariffs/getBestTariff")
    MaxMinutesIdDTO getBestTariffId(@RequestBody TiempoDTO tiempo);

    @PostMapping("/tariffs/getid")
    ResponseEntity<TariffBasicDTO> getTariffById(@RequestBody IdDTO id);
}
