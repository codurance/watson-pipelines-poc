package com.watson.app1;

import java.util.Arrays;
import java.util.List;

public class InMemoryEmployeeRepository implements EmployeesRepository {

  private final List<Employee> employees = Arrays.asList(
      new Employee(1, "Ben Dover"),
      new Employee(2, "Anne Chovee"),
      new Employee(3, "Diana Prince"));

  @Override
  public List<Employee> findAll() {
    return employees;
  }

  @Override
  public Employee findById(int id) {
    return employees.stream()
        .filter(employee -> employee.getId() == id)
        .findFirst()
        .orElse(null);
  }
}
