package com.watson.employees;

public class EmployeeNotAvailable extends RuntimeException {

  public EmployeeNotAvailable(Throwable error) {
    super(error);
  }
}
