package com.watson.app1;

import com.watson.app1.employees.get.GetEmployeeOutput;
import com.watson.app1.employees.get.GetEmployeeResponse;
import com.watson.app1.employees.getall.GetAllEmployeesOutput;
import com.watson.app1.employees.getall.GetAllEmployeesResponse;
import java.util.Collections;
import java.util.List;

public class EmployeeParser implements GetAllEmployeesOutput, GetEmployeeOutput {

  private List<Employee> employees;

  @Override
  public void processResponse(GetAllEmployeesResponse response) {
    employees = response.getEmployees();
  }

  @Override
  public void processResponse(GetEmployeeResponse response) {
    employees = Collections.singletonList(response.getEmployee());
  }

  public List<Employee> getEmployees() {
    return employees;
  }

  public Employee getEmployee() {
    return employees.get(0);
  }
}
