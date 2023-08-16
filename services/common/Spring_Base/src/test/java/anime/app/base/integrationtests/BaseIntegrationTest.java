package anime.app.base.integrationtests;

import com.fasterxml.jackson.databind.ObjectMapper;
import dasniko.testcontainers.keycloak.KeycloakContainer;
import org.junit.jupiter.api.BeforeEach;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.client.MockMvcWebTestClient;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.testcontainers.containers.output.Slf4jLogConsumer;
import org.testcontainers.containers.startupcheck.MinimumDurationRunningStartupCheckStrategy;

import java.io.File;
import java.nio.file.FileSystems;
import java.time.Duration;
import java.util.Arrays;


import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles(profiles = "test")
public class BaseIntegrationTest {
    protected final static Slf4jLogConsumer containerLogger = new Slf4jLogConsumer(LoggerFactory.getLogger(BaseIntegrationTest.class));

    @Autowired
    protected ObjectMapper mapper;

    @Autowired
    protected WebApplicationContext context;

    protected WebTestClient webTestClient;

    protected static KeycloakContainer keycloak = new KeycloakContainer("quay.io/keycloak/keycloak:22.0.0")
            .withRealmImportFile("realm-export.json")
            .withAdminUsername("admin")
            .withAdminPassword("Password1")
            .withExposedPorts(8080)
            .withStartupCheckStrategy(
                    new MinimumDurationRunningStartupCheckStrategy(Duration.ofSeconds(5))
            )
            .withLogConsumer(containerLogger)
            .withReuse(true);

    // This is not BeforeAll, as we need the containers running inside 'registerContainerProperties' function (below)
    static {
//        String classpath = System.getProperty("java.class.path");
//        String[] classPathValues = classpath.split(File.pathSeparator);
//        String realmPath = Arrays.stream(classPathValues).filter(path -> path.contains("realm-export.json")).findFirst().orElseThrow(() -> new IllegalArgumentException("Could not find realm export"));
//        System.out.println(Arrays.toString(classPathValues));
//        System.out.printf(realmPath);

//        keycloak = new KeycloakContainer("quay.io/keycloak/keycloak:22.0.0")
//                .withRealmImportFile(realmPath)
//                .withAdminUsername("admin")
//                .withAdminPassword("Password1")
//                .withExposedPorts(8080)
//                .withStartupCheckStrategy(
//                        new MinimumDurationRunningStartupCheckStrategy(Duration.ofSeconds(5))
//                )
//                .withLogConsumer(containerLogger)
//                .withReuse(true);

        keycloak.start();
    }

    @BeforeEach
    public void setup() {
        MockMvc mockMvc = MockMvcBuilders
                .webAppContextSetup(context)
                .apply(springSecurity())
                .build();

        this.webTestClient = MockMvcWebTestClient
                .bindTo(mockMvc)
                .build();

        assertThat(keycloak.isRunning(), is(true));
    }

    /**
     * Add container information for properties
     * @param registry The registry holding the properties
     */
    @DynamicPropertySource
    protected static void registerContainerProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.security.oauth2.resourceserver.jwt.issuer-uri", () -> String.format("%s/realms/Keycloak_Instance", keycloak.getAuthServerUrl()));
        registry.add("spring.security.oauth2.resourceserver.jwt.jwk-set-uri", () -> String.format("%s/realms/Keycloak_Instance/protocol/openid-connect/certs", keycloak.getAuthServerUrl()));
    }
}
