package microservice.backend.repositories;

import microservice.backend.dto.DesctNumberDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Repository
@FeignClient(name = "discount-people-service")
public interface DesctNumberClient {

    @GetMapping("/desctnumber/")
    List<DesctNumberDTO> getAllDesctNumbers();
}