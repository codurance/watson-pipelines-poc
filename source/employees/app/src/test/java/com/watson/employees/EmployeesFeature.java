package com.watson.employees;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;

import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.watson.employees.Employee;
import com.watson.employees.EmployeeNotAvailable;
import com.watson.employees.EmployeeParser;
import com.watson.employees.EmployeesRepository;
import com.watson.employees.EmployeesService;
import com.watson.employees.employees.get.GetEmployee;
import com.watson.employees.employees.getall.GetAllEmployees;

@ExtendWith(MockitoExtension.class)
public class EmployeesFeature {

  @Mock
  private EmployeesRepository employeesRepository;
  private EmployeesService service;

  @BeforeEach
  public void setUp() {
    service = new EmployeesService(new GetAllEmployees(employeesRepository),
        new GetEmployee(employeesRepository), new EmployeeParser());
  }

  @Test
  public void shouldReturnEmployees() {
    List<Employee> expected = Arrays.asList(new Employee(1, "Ben Dover"),
        new Employee(2, "Anne Chovee"));
    given(employeesRepository.findAll())
        .willReturn(expected);

    List<Employee> actual = service.getAll();

    assertThat(actual).hasSameElementsAs(expected);
  }

  @Test
  void shouldReturnEmployeeById() {
    int id = 1;
    Employee expected = new Employee(id, "Ben Dover");
    given(employeesRepository.findById(id)).willReturn(expected);

    Employee actual = service.getEmployee(id);

    assertThat(actual).isEqualTo(expected);
  }

  @Test
  void shouldThrowExceptionIfEmployeeDoesNotExist() {
    int id = 1;
    given(employeesRepository.findById(id)).willReturn(null);

    assertThatThrownBy(() -> service.getEmployee(id)).isInstanceOf(EmployeeNotAvailable.class);
  }
}
