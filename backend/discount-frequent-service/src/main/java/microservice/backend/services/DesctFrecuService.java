package microservice.backend.services;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.DesctDTO;
import microservice.backend.entities.DesctFrecuEntity;
import microservice.backend.repositories.DesctFrecuRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DesctFrecuService {

    private final DesctFrecuRepository desctFrecuRepository;

    public List<DesctFrecuEntity> getAll() {
        return desctFrecuRepository.findAll();
    }

    public double obtenerDescuento(int veces) {
        DesctFrecuEntity descuento = desctFrecuRepository
                .findFirstByMinvecesLessThanEqualAndMaxvecesGreaterThanEqual(veces, veces);
        return descuento != null ? descuento.getPorcentajedesct() : 0.0;
    }

    public List<Double> obtenerDescuentos(List<Integer> listaVeces) {
        return listaVeces.stream()
                .map(this::obtenerDescuento)
                .toList();
    }

    public void guardar(DesctDTO desctDTO) {
        DesctFrecuEntity entity;
        if (desctDTO.getId() != null) {
            entity = desctFrecuRepository.findById(desctDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Descuento no encontrado"));
            entity.setMinveces(desctDTO.getMinveces());
            entity.setMaxveces(desctDTO.getMaxveces());
            entity.setPorcentajedesct(desctDTO.getPorcentajedesct());
        } else {
            entity = new DesctFrecuEntity(
                    null,
                    desctDTO.getMinveces(),
                    desctDTO.getMaxveces(),
                    desctDTO.getPorcentajedesct()
            );
        }
        desctFrecuRepository.save(entity);
    }

}
