package microservice.backend.repositories;


import microservice.backend.dto.MADDTO;
import microservice.backend.dto.ReserveDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Repository
@FeignClient(name = "reserve-service")
public interface ReserveClient {

    @PostMapping("/reserves/week")
    ResponseEntity<List<ReserveDTO>> listReservesByWeek(@RequestBody MADDTO maddto);

}