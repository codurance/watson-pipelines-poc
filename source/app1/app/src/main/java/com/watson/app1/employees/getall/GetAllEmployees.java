package com.watson.app1.employees.getall;

import com.watson.app1.EmployeesRepository;

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
