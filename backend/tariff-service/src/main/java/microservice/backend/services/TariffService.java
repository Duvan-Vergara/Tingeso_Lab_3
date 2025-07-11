package microservice.backend.services;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.MaxMinutesIdDTO;
import microservice.backend.dto.PrecioDTO;
import microservice.backend.dto.TariffBasicDTO;
import microservice.backend.dto.TariffBasicIdDTO;
import microservice.backend.entities.TariffEntity;
import microservice.backend.repositories.TariffRepository;
import microservice.backend.repositories.TariffSpecialClient;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TariffService {

    private final TariffRepository tariffRepository;
    private final TariffSpecialClient tariffSpecialClient;

    public List<TariffBasicIdDTO> getAllTariffs(){
        List<TariffEntity> tariffs = tariffRepository.findAll();
        List<TariffBasicIdDTO> tariffBasicIdDTOs = new ArrayList<>();
        for (TariffEntity tariff : tariffs) {
            TariffBasicIdDTO dto = new TariffBasicIdDTO(tariff.getId(), tariff.getLaps(), tariff.getMaxMinutes());
            tariffBasicIdDTOs.add(dto);
        }
        return tariffBasicIdDTOs;
    }

    public List<TariffEntity> getTariffs(){
        return new ArrayList<>(tariffRepository.findAll());
    }

    public TariffEntity saveTariff(TariffEntity tariff) {
        return tariffRepository.save(tariff);
    }

    public double getPrice(LocalDate fecha, Long idTariff) {
        TariffEntity tarifa = tariffRepository.findById(idTariff)
                .orElseThrow(() -> new IllegalArgumentException("Tarifa no encontrada con id: " + idTariff));
        PrecioDTO precioDTO = new PrecioDTO();
        precioDTO.setFecha(fecha);
        precioDTO.setPrecioRegular(tarifa.getRegularPrice());
        return tariffSpecialClient.obtenerPrecio(precioDTO);
    }

    public TariffBasicDTO getTariffById(Long id){
        TariffEntity tariffEntity = tariffRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Tarifa no encontrada con id: " + id));
        return new TariffBasicDTO(tariffEntity.getLaps(), tariffEntity.getMaxMinutes());
    }

    public void deleteTariff(Long id){
        tariffRepository.deleteById(id);
    }

    public MaxMinutesIdDTO getBestTariffid(long minutos){
        MaxMinutesIdDTO maxMinutesIdDTO = new MaxMinutesIdDTO();
        TariffEntity bestTariff;
        List<TariffEntity> tarifasAdecuadas = tariffRepository.findFirstByTotalDurationGreaterThanEqualOrderByTotalDurationAsc(minutos);
        if (!tarifasAdecuadas.isEmpty()) {
            bestTariff = tarifasAdecuadas.get(0);
            maxMinutesIdDTO.setId(bestTariff.getId());
            maxMinutesIdDTO.setMaxMinutes(bestTariff.getMaxMinutes());
        } else {
            List<TariffEntity> maxTarifa = tariffRepository.findTopByOrderByTotalDurationDesc();
            if (!maxTarifa.isEmpty()) {
                bestTariff = maxTarifa.get(0);
                maxMinutesIdDTO.setId(bestTariff.getId());
                maxMinutesIdDTO.setMaxMinutes(bestTariff.getMaxMinutes());
            } else {
                throw new IllegalArgumentException("No se encontró una tarifa adecuada para " + minutos + " minutos.");
            }
        }
        return maxMinutesIdDTO;
    }

}
