package com.watson.app1.employees.getall;

import com.watson.app1.Employee;
import java.util.List;

public class GetAllEmployeesResponse {

  private final List<Employee> employees;

  public GetAllEmployeesResponse(List<Employee> employees) {
    this.employees = employees;
  }

  public List<Employee> getEmployees() {
    return employees;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((employees == null) ? 0 : employees.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    GetAllEmployeesResponse other = (GetAllEmployeesResponse) obj;
    if (employees == null) {
      if (other.employees != null) {
        return false;
      }
    } else if (!employees.equals(other.employees)) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "GetAllEmployeesResponse [employees=" + employees + "]";
  }
}
