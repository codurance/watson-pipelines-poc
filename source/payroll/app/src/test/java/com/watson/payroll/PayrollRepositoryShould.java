package com.watson.payroll;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDate;
import java.util.Arrays;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.watson.payroll.Payroll;
import com.watson.payroll.PayrollRepository;

public class PayrollRepositoryShould {

  private PayrollRepository repository;

  @BeforeEach
  public void setUp() {
    repository = new PayrollRepository();
  }

  @Test
  public void shouldReturnPayrollForEmployee() {
    assertThat(repository.byEmployee(1))
        .hasSameElementsAs(Arrays.asList(
            new Payroll(LocalDate.of(2022, 9, 1), 1, 3000),
            new Payroll(LocalDate.of(2022, 8, 1), 1, 2500)));
  }
}
