package microservice.backend.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * RF7 Performance Optimization: Cache Configuration for Rack Service
 * Enables caching for weekly occupancy data to improve performance
 */
@Configuration
@EnableCaching
public class CacheConfig {

    @Bean
    public CacheManager cacheManager() {
        ConcurrentMapCacheManager cacheManager = new ConcurrentMapCacheManager();

        cacheManager.setCacheNames(java.util.Arrays.asList(
            "weeklyRack",
            "weekReserves",
            "availabilityData"
        ));

        cacheManager.setAllowNullValues(false);
        
        return cacheManager;
    }
}
