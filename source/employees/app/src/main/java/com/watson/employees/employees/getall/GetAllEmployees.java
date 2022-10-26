package com.watson.employees.employees.getall;

import com.watson.employees.EmployeesRepository;

public class GetAllEmployees implements GetAllEmployeesInput {

  private final EmployeesRepository repository;

  public GetAllEmployees(EmployeesRepository repository) {
    this.repository = repository;
  }

  @Override
  public void execute(GetAllEmployeesRequest request, GetAllEmployeesOutput output) {
    output.processResponse(new GetAllEmployeesResponse(repository.findAll()));

  }
}
