package com.watson.employees.employees;

public class EmployeeNotFound extends RuntimeException {

  private final int id;

  public EmployeeNotFound(int id) {
    super("Employee with id " + id + " not found.");
    this.id = id;
  }

  public int getId() {
    return id;
  }
}
