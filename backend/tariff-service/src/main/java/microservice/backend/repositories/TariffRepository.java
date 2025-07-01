package microservice.backend.repositories;

import microservice.backend.entities.TariffEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TariffRepository extends JpaRepository<TariffEntity, Long> {

    @Query("SELECT t FROM TariffEntity t WHERE t.totalDuration >= :minutos ORDER BY t.totalDuration ASC")
    List<TariffEntity> findFirstByTotalDurationGreaterThanEqualOrderByTotalDurationAsc(@Param("minutos") long minutos);

    @Query("SELECT t FROM TariffEntity t ORDER BY t.totalDuration DESC")
    List<TariffEntity> findTopByOrderByTotalDurationDesc();
}
