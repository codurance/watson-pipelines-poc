package com.watson.app2;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDate;
import java.util.Arrays;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;

public class PayrollFeature {
    private MockWebServer server;
    private PayrollService service;

    @BeforeEach
    public void setUp() {
        server = new MockWebServer();
        EmployeesRepository employeesRepository = new EmployeesRepository(server.url("/").toString());
        PayrollRepository payrollRepository = new PayrollRepository();
        service = new PayrollService(employeesRepository, payrollRepository);
    }

    @Test
    public void shouldReturnPayrollForAnEmployee() {
        int id = 1;
        PayrollReport expected = new PayrollReport(
                "Ben Dover", Arrays.asList(
                    new PayrollReportLine(LocalDate.of(2022, 9, 1), 3000), 
                    new PayrollReportLine(LocalDate.of(2022, 8, 1), 2500)));
        server.enqueue(new MockResponse().setBody("{\"id\": 1, \"name\": \"Ben Dover\"}"));

        PayrollReport actual = service.getPayrollFor(id);

        assertThat(actual).isEqualTo(expected);
    }

    @AfterEach
    public void tearDown() throws Exception {
        server.shutdown();
    }
}
