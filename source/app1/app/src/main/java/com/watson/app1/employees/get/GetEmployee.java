package com.watson.app1.employees.get;

import com.watson.app1.Employee;
import com.watson.app1.EmployeesRepository;
import com.watson.app1.employees.EmployeeNotFound;

public class GetEmployee implements GetEmployeeInput {

  private EmployeesRepository employeesRepository;

  public GetEmployee(EmployeesRepository employeesRepository) {
    this.employeesRepository = employeesRepository;
  }

  @Override
  public void execute(GetEmployeeRequest getEmployeeRequest, GetEmployeeOutput output) {
    Employee employee = employeesRepository.findById(getEmployeeRequest.getId());

    if (employee == null) {
      output.processResponse(new EmployeeNotFound(getEmployeeRequest.getId()));
    } else {
      output.processResponse(new GetEmployeeResponse(employee));
    }
  }
}
