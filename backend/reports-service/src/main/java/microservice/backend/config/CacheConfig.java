package microservice.backend.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * RF8 Performance Optimization: Cache Configuration for Reports Service
 * Enables caching for expensive report generation operations
 */
@Configuration
@EnableCaching
public class CacheConfig {

    @Bean
    public CacheManager cacheManager() {
        ConcurrentMapCacheManager cacheManager = new ConcurrentMapCacheManager();
        
        // Configure cache names for reports service
        cacheManager.setCacheNames(java.util.Arrays.asList(
            "tariffReports",
            "groupSizeReports",
            "revenueReports",
            "monthlyStats"
        ));

        cacheManager.setAllowNullValues(false);
        
        return cacheManager;
    }
}
