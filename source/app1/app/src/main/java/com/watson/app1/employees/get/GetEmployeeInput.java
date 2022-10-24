package com.watson.app1.employees.get;

import com.watson.app1.EmployeeParser;

public interface GetEmployeeInput {

  void execute(GetEmployeeRequest getEmployeeRequest, GetEmployeeOutput output);
}
