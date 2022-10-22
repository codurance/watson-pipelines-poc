package com.watson.app1;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;

import com.watson.app1.employees.getall.GetAllEmployees;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class EmployeesFeature {

  @Mock
  private EmployeesRepository employeesRepository;
  private EmployeesService service;

  @BeforeEach
  public void setUp() {
    service = new EmployeesService(new GetAllEmployees(employeesRepository), new EmployeeParser());
  }

  @Test
  public void shouldReturnEmployees() throws Exception {
    List<Employee> expected = Arrays.asList(new Employee(1, "Ben Dover"),
        new Employee(2, "Anne Chovee"));
    given(employeesRepository.findAll())
        .willReturn(expected);

    List<Employee> actual = service.getAll();

    assertThat(actual).hasSameElementsAs(expected);
  }
}
