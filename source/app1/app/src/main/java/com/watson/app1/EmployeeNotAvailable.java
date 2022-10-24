package com.watson.app1;

public class EmployeeNotAvailable extends RuntimeException {

  public EmployeeNotAvailable(Throwable error) {
    super(error);
  }
}
