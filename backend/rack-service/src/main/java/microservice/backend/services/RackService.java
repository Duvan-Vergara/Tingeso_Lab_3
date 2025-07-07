package microservice.backend.services;

import lombok.RequiredArgsConstructor;
import microservice.backend.dto.MADDTO;
import microservice.backend.dto.ReserveDTO;
import microservice.backend.repositories.ReserveClient;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
@RequiredArgsConstructor
public class RackService {

    private final ReserveClient reserveClient;
    
    private final Map<String, String> formatCache = new ConcurrentHashMap<>();

    @Cacheable(value = "weekReserves", key = "#year + '_' + #month + '_' + #day", unless = "#result.isEmpty()")
    public List<List<String>> getReserveByWeek(int year, int month, int day) {
        LocalDate date = LocalDate.of(year, month, day);
        LocalDate startDate = date.with(TemporalAdjusters.previousOrSame(java.time.DayOfWeek.MONDAY));

        List<ReserveDTO> reserves = reserveClient.listReservesByWeek(new MADDTO(year, month, day)).getBody();
        List<ReserveDTO> safeReserves = Optional.ofNullable(reserves).orElse(Collections.emptyList());

        Map<LocalDate, List<ReserveDTO>> reservesByDate = safeReserves.stream()
                .collect(Collectors.groupingBy(ReserveDTO::getReserveday));

        return IntStream.range(0, 7)
                .mapToObj(startDate::plusDays)
                .map(d -> reservesByDate.getOrDefault(d, Collections.emptyList())
                        .stream()
                        .map(this::formatReserveOptimized)
                        .collect(Collectors.toList()))
                .collect(Collectors.toList());
    }

    private String formatReserveOptimized(ReserveDTO r) {
        String cacheKey = r.getUsername() + "_" + r.getBegin() + "_" + r.getFinish();
        
        return formatCache.computeIfAbsent(cacheKey, k -> {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("H:mm");
            return r.getUsername() + " (" + r.getBegin().format(formatter) + " - " + r.getFinish().format(formatter) + ")";
        });
    }
}