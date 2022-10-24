package com.watson.app1.employees.get;

import com.watson.app1.Employee;
import com.watson.app1.EmployeesRepository;

public class GetEmployee implements GetEmployeeInput {

  private EmployeesRepository employeesRepository;

  public GetEmployee(EmployeesRepository employeesRepository) {
    this.employeesRepository = employeesRepository;
  }

  @Override
  public void execute(GetEmployeeRequest getEmployeeRequest, GetEmployeeOutput output) {
    Employee employee = employeesRepository.findById(getEmployeeRequest.getId());
    output.processResponse(new GetEmployeeResponse(employee));
  }
}
