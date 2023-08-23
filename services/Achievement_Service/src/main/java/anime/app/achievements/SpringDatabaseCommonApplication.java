package anime.app.achievements;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;

@SpringBootApplication(exclude = { RabbitAutoConfiguration.class })
public class SpringDatabaseCommonApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringDatabaseCommonApplication.class, args);
    }
}
