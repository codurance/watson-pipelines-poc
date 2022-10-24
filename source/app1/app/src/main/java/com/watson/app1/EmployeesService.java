package com.watson.app1;

import com.watson.app1.employees.get.GetEmployeeInput;
import com.watson.app1.employees.get.GetEmployeeRequest;
import com.watson.app1.employees.getall.GetAllEmployeesInput;
import com.watson.app1.employees.getall.GetAllEmployeesRequest;
import java.util.List;

public class EmployeesService {

  private GetAllEmployeesInput getAllEmployees;
  private GetEmployeeInput getEmployee;
  private EmployeeParser parser;

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
