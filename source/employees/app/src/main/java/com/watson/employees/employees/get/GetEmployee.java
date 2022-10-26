package com.watson.employees.employees.get;

import com.watson.employees.Employee;
import com.watson.employees.EmployeesRepository;
import com.watson.employees.employees.EmployeeNotFound;

public class GetEmployee implements GetEmployeeInput {

  private final EmployeesRepository employeesRepository;

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
