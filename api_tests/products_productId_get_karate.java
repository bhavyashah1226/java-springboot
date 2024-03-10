
  package app.api;;

  import app.App;
  import com.intuit.karate.Results;
  import com.intuit.karate.Runner;
  import com.intuit.karate.http.HttpServer;
  import com.intuit.karate.http.ServerConfig;
  import org.junit.jupiter.api.Test;

  import static org.junit.jupiter.api.Assertions.assertEquals;

  class products_productId_get_karate {

      @Test
      void testAll() {
          ServerConfig config = App.serverConfig("src/main/java/app");
          HttpServer server = HttpServer.config(config).build();
          Results results = Runner.path("classpath:C:\var\tmp\Roost\RoostGPT\products-karate\1710095706\source\java-springboot\api_tests\products_productId_get_karate.feature")
                  .systemProperty("url.base", "http://localhost:" + server.getPort())
                  .parallel(1);
          assertEquals(0, results.getFailCount(), results.getErrorMessages());
      }

  }
