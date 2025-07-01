package microservice.backend.repositories;

import microservice.backend.dto.ReserveBasicDTO;
import microservice.backend.dto.StarEndDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Repository
@FeignClient(name = "reserve-service")
public interface ReserveClient {

    @PostMapping("/reserves/getAll")
    List<ReserveBasicDTO> getAll(@RequestBody StarEndDTO tiempo);
}