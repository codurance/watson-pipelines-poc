package com.watson.employees;

import java.util.List;

public interface EmployeesRepository {

  List<Employee> findAll();

  Employee findById(int id);
}
