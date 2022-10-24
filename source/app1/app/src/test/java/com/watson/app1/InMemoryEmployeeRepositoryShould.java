package com.watson.app1;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InMemoryEmployeeRepositoryShould {

  private EmployeesRepository repository;

  @BeforeEach
  void setUp() {
    repository = new InMemoryEmployeeRepository();
  }

  @Test
  void returnNullWhenEmployeeDoesNotExist() {
    assertThat(repository.findById(5)).isNull();
  }

  @Test
  void findEmployeeById() {
    int id = 1;
    Employee employee = new Employee(id, "Ben Dover");

    assertThat(repository.findById(id)).isEqualTo(employee);
  }

  @Test
  void findAllEmployees() {
    List<Employee> employees = Arrays.asList(
        new Employee(1, "Ben Dover"),
        new Employee(2, "Anne Chovee"),
        new Employee(3, "Diana Prince"));

    assertThat(repository.findAll()).hasSameElementsAs(employees);
  }
}
