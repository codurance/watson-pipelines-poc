package com.watson.app2;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface EmployeesRest {
    @GET("/employee/{id}")
    Call<Employee> byId(@Path("id") int id);
}
