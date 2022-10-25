package com.watson.app2;

import static org.assertj.core.api.Assertions.assertThat;

import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmployeeRepositoryShould {

  private MockWebServer server;
  private EmployeesRepository repository;

  @BeforeEach
  public void setUp() {
    server = new MockWebServer();
    repository = new EmployeesRepository(server.url("/").toString());
  }

  @Test
  public void getEmployeeById() throws Exception {
    server.enqueue(new MockResponse().setBody("{\"id\": 1, \"name\": \"Ben Dover\"}"));

    assertThat(repository.byId(1)).isEqualTo(new Employee(1, "Ben Dover"));
  }

  @AfterEach
  public void tearDown() throws Exception {
    server.shutdown();
  }
}
