package com.watson.employees;

import static spark.Spark.get;

import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;
import com.watson.employees.employees.get.GetEmployee;
import com.watson.employees.employees.get.GetEmployeeInput;
import com.watson.employees.employees.getall.GetAllEmployees;
import com.watson.employees.employees.getall.GetAllEmployeesInput;

import java.util.List;
import spark.Request;
import spark.Response;

public class App {

  public static void main(String[] args) {
    App app = new App();

    EmployeesRepository repository = new InMemoryEmployeeRepository();
    GetAllEmployeesInput getAllEmployeesInput = new GetAllEmployees(repository);
    GetEmployeeInput getEmployeeInput = new GetEmployee(repository);
    EmployeeParser parser = new EmployeeParser();
    EmployeesService service = new EmployeesService(getAllEmployeesInput, getEmployeeInput,
        parser);

    Moshi moshi = new Moshi.Builder().build();

    get("/employees", (req, res) -> app.getEmployees(res, moshi, service));
    get("/employees/:id", (req, res) -> app.getEmployeesById(req, res, moshi, service));
  }

  private Object getEmployees(Response res, Moshi moshi,
      EmployeesService service) {
    res.header("Content-Type", "application/json");
    JsonAdapter<List<Employee>> employeesListAdapter = moshi.adapter(
        Types.newParameterizedType(List.class, Employee.class));
    return employeesListAdapter.toJson(service.getAll());
  }

  private Object getEmployeesById(Request req, Response res, Moshi moshi,
      EmployeesService service) {
    try {
      res.header("Content-Type", "application/json");
      JsonAdapter<Employee> employeeAdapter = moshi.adapter(Employee.class);
      return employeeAdapter.toJson(service.getEmployee(Integer.parseInt(req.params(":id"))));
    } catch (EmployeeNotAvailable e) {
      res.status(404);
      return e.getCause().getMessage();
    }
  }
}
