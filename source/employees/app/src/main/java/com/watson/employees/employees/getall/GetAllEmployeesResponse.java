package com.watson.employees.employees.getall;

import java.util.List;
import java.util.Objects;

import com.watson.employees.Employee;

public class GetAllEmployeesResponse {

  private final List<Employee> employees;

  public GetAllEmployeesResponse(List<Employee> employees) {
    this.employees = employees;
  }

  public List<Employee> getEmployees() {
    return employees;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    GetAllEmployeesResponse that = (GetAllEmployeesResponse) o;
    return Objects.equals(getEmployees(), that.getEmployees());
  }

  @Override
  public int hashCode() {
    return Objects.hash(getEmployees());
  }

  @Override
  public String toString() {
    return "GetAllEmployeesResponse{" +
        "employees=" + employees +
        '}';
  }
}
