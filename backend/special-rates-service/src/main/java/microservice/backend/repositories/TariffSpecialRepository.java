package microservice.backend.repositories;

import microservice.backend.entities.TariffSpecial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TariffSpecialRepository extends JpaRepository<TariffSpecial, Long> {

    TariffSpecial findFirstByOrderByIdAsc();
}
