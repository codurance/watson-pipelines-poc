package com.watson.app2;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;

import java.time.LocalDate;
import java.util.Arrays;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class PayrollServiceShould {

  @Mock
  private EmployeesRepository employeesRepository;
  @Mock
  private PayrollRepository payrollRepository;
  @InjectMocks
  private PayrollService service;

  @Test
  public void shouldGetPayrollForEmployee() throws Exception {
    int id = 1;
    given(employeesRepository.byId(id))
        .willReturn(new Employee(1, "Ben Dover"));
    given(payrollRepository.byEmployee(id))
        .willReturn(Arrays.asList(
            new Payroll(LocalDate.of(2022, 9, 1), id, 1000),
            new Payroll(LocalDate.of(2022, 8, 1), id, 5000)));

    assertThat(service.getPayrollFor(id))
        .isEqualTo(new PayrollReport("Ben Dover", Arrays.asList(
            new PayrollReportLine(LocalDate.of(2022, 9, 1), 1000),
            new PayrollReportLine(LocalDate.of(2022, 8, 1), 5000))));
  }
}
