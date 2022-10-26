package com.watson.payroll;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface EmployeesRest {

  @GET("/employees/{id}")
  Call<Employee> byId(@Path("id") int id);
}
