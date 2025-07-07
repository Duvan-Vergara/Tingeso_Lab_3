package microservice.backend.repositories;

import microservice.backend.entities.ReserveEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReserveRepository extends JpaRepository<ReserveEntity, Long> {

    // RF5 Performance Optimization: Buscar reservas por mes y rut con índice optimizado
    @Query("SELECT r FROM ReserveEntity r JOIN FETCH r.reservesUsers g WHERE MONTH(r.reserveday) = :month AND g.rut = :rut")
    List<ReserveEntity> getReservesByDateMonthAndRut(@Param("rut") String rut, @Param("month") int month);

    // RF5 Performance Optimization: Buscar reservas entre fechas con paginación
    @Query("SELECT r FROM ReserveEntity r WHERE r.reserveday BETWEEN :startDate AND :endDate")
    Page<ReserveEntity> getReserveByDateBetweenPaginated(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    // Método original para compatibilidad
    @Query("SELECT r FROM ReserveEntity r WHERE r.reserveday BETWEEN :startDate AND :endDate")
    List<ReserveEntity> getReserveByDate_DateBetween(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    // RF5 Performance Optimization: Búsqueda optimizada por usuario con límite
    @Query("SELECT r FROM ReserveEntity r JOIN FETCH r.reservesUsers g WHERE g.rut = :rut ORDER BY r.reserveday DESC")
    List<ReserveEntity> findByUserRutOrderByDateDesc(@Param("rut") String rut, Pageable pageable);
}
