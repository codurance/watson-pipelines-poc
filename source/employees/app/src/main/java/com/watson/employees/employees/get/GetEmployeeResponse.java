package com.watson.employees.employees.get;

import java.util.Objects;

import com.watson.employees.Employee;

public class GetEmployeeResponse {

  private final Employee employee;

  public GetEmployeeResponse(Employee employee) {
    this.employee = employee;
  }

  public Employee getEmployee() {
    return employee;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    GetEmployeeResponse that = (GetEmployeeResponse) o;
    return Objects.equals(getEmployee(), that.getEmployee());
  }

  @Override
  public int hashCode() {
    return Objects.hash(getEmployee());
  }

  @Override
  public String toString() {
    return "GetEmployeeResponse{" +
        "employee=" + employee +
        '}';
  }
}
