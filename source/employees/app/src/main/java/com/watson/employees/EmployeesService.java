package com.watson.employees;

import java.util.List;

import com.watson.employees.employees.get.GetEmployeeInput;
import com.watson.employees.employees.get.GetEmployeeRequest;
import com.watson.employees.employees.getall.GetAllEmployeesInput;
import com.watson.employees.employees.getall.GetAllEmployeesRequest;

public class EmployeesService {

  private final GetAllEmployeesInput getAllEmployees;
  private final GetEmployeeInput getEmployee;
  private final EmployeeParser parser;

  public EmployeesService(GetAllEmployeesInput getAllEmployees, GetEmployeeInput getEmployee,
      EmployeeParser parser) {
    this.getAllEmployees = getAllEmployees;
    this.getEmployee = getEmployee;
    this.parser = parser;
  }

  public List<Employee> getAll() {
    getAllEmployees.execute(new GetAllEmployeesRequest(), parser);
    return parser.getEmployees();
  }

  public Employee getEmployee(int id) {
    getEmployee.execute(new GetEmployeeRequest(id), parser);
    return parser.getEmployee();
  }
}
