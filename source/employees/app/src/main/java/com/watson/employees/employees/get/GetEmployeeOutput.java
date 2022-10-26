package com.watson.employees.employees.get;

import com.watson.employees.employees.EmployeeNotFound;

public interface GetEmployeeOutput {

  void processResponse(GetEmployeeResponse response);

  void processResponse(EmployeeNotFound error);
}
