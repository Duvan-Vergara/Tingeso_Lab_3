package microservice1.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class TariffServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(TariffServiceApplication.class, args);
	}

}