package microservice.backend.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "desctnumber")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DesctNumberEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    private int minpersonas;
    private int maxpersonas;
    private double porcentajedesct;
}