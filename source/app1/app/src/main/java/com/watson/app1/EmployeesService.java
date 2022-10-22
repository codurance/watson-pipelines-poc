package com.watson.app1;

import com.watson.app1.employees.getall.GetAllEmployeesInput;
import com.watson.app1.employees.getall.GetAllEmployeesRequest;
import java.util.List;

public class EmployeesService {

  private GetAllEmployeesInput getAllEmployees;
  private EmployeeParser parser;

  public EmployeesService(GetAllEmployeesInput getAllEmployees, EmployeeParser parser) {
    this.getAllEmployees = getAllEmployees;
    this.parser = parser;
  }

  public List<Employee> getAll() {
    getAllEmployees.execute(new GetAllEmployeesRequest(), parser);
    return parser.getEmployees();
  }
}
