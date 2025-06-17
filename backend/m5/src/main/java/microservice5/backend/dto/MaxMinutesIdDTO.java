package microservice5.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaxMinutesIdDTO {
    private long id;
    private long maxMinutes;
}
