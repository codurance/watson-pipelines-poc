package com.watson.app1.employees.get;

import com.watson.app1.employees.EmployeeNotFound;

public interface GetEmployeeOutput {

  void processResponse(GetEmployeeResponse response);

  void processResponse(EmployeeNotFound error);
}
