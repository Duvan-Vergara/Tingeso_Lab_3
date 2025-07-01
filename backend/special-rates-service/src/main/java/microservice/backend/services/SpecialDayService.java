package microservice.backend.services;


import lombok.RequiredArgsConstructor;
import microservice.backend.entities.SpecialDayEntity;
import microservice.backend.repositories.SpecialDayRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SpecialDayService {

    private final SpecialDayRepository specialDayRepository;

    public List<SpecialDayEntity> getSpecialDays() {
        return specialDayRepository.findAll();
    }

    public SpecialDayEntity saveSpecialDay(SpecialDayEntity specialDay) {
        return specialDayRepository.save(specialDay);
    }

    public SpecialDayEntity getSpecialDayById(Long id) {
        return specialDayRepository.findById(id)
                .orElseThrow(() -> new SpecialDayServiceException("Día especial no encontrado con id: " + id, null));
    }

    public boolean deleteSpecialDayByID(Long id) throws Exception {
        try {
            specialDayRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            throw new SpecialDayServiceException("Error eliminando el día especial con id:" + id, e);
        }
    }

    public static class SpecialDayServiceException extends RuntimeException {
        public SpecialDayServiceException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}
