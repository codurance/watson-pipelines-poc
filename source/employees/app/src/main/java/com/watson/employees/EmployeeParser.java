package com.watson.employees;

import java.util.Collections;
import java.util.List;

import com.watson.employees.employees.EmployeeNotFound;
import com.watson.employees.employees.get.GetEmployeeOutput;
import com.watson.employees.employees.get.GetEmployeeResponse;
import com.watson.employees.employees.getall.GetAllEmployeesOutput;
import com.watson.employees.employees.getall.GetAllEmployeesResponse;

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

  @Override
  public void processResponse(EmployeeNotFound error) {
    throw new EmployeeNotAvailable(error);
  }

  public List<Employee> getEmployees() {
    return employees;
  }

  public Employee getEmployee() {
    return employees.get(0);
  }
}
