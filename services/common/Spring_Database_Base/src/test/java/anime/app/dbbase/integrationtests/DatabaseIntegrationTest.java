package anime.app.dbbase.integrationtests;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

import anime.app.base.integrationtests.BaseIntegrationTest;
import java.time.Duration;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.containers.startupcheck.MinimumDurationRunningStartupCheckStrategy;

public class DatabaseIntegrationTest extends BaseIntegrationTest {

    protected static final PostgreSQLContainer<?> postreg =
        new PostgreSQLContainer<>("postgres:14.1-alpine")
            .withDatabaseName("service")
            .withUsername("appUser")
            .withPassword("appPassword1")
            .withExposedPorts(5432)
            .withStartupCheckStrategy(
                new MinimumDurationRunningStartupCheckStrategy(
                    Duration.ofSeconds(5)
                )
            )
            .withLogConsumer(containerLogger)
            .withReuse(true);

    static {
        postreg.start();
    }

    @Override
    @BeforeEach
    public void setup() {
        super.setup();
        assertThat(postreg.isRunning(), is(true));
    }

    /**
     * Add container information for properties
     *
     * @param registry The registry holding the properties
     */
    @DynamicPropertySource
    protected static void registerContainerProperties(
        DynamicPropertyRegistry registry
    ) {
        registry.add("spring.datasource.url", postreg::getJdbcUrl);
    }
}
