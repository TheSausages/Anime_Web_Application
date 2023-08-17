package anime.app.base.configuration;

import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.text.SimpleDateFormat;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configure an app-wide {@link ObjectMapper} with:
 *
 * <ul>
 *   <li>The {@link DefaultPrettyPrinter} enabled
 *   <li>Use the {@link JavaTimeModule}
 *   <li>The date format is <i>yyyy-MM-dd</i>
 * </ul>
 */
@Configuration
public class ObjectMapperConfiguration {

    @Bean
    ObjectMapper getObjectMapper() {
        return ObjectMapperFactory.getNewObjectMapper();
    }

    /**
     * Small helper class. Used to always get an ObjectMapper with default settings, even when a new
     * one must be created, ex. in static methods.
     */
    public static class ObjectMapperFactory {

        public static ObjectMapper getNewObjectMapper() {
            return new ObjectMapper()
                .enable(SerializationFeature.INDENT_OUTPUT)
                .setDefaultPrettyPrinter(new DefaultPrettyPrinter())
                .registerModule(new JavaTimeModule())
                .setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
        }
    }
}
