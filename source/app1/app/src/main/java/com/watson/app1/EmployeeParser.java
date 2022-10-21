package com.watson.app1;

import java.util.List;

import com.watson.app1.employees.getall.GetAllEmployeesOutput;
import com.watson.app1.employees.getall.GetAllEmployeesResponse;

public class EmployeeParser implements GetAllEmployeesOutput {
    private List<Employee> employees;

    @Override
    public void processResponse(GetAllEmployeesResponse response) {
        employees = response.getEmployees();
    }

    public List<Employee> getEmployees() {
        return employees;
    }
}
