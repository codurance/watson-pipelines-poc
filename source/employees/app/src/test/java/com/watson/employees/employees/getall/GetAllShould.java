package com.watson.employees.employees.getall;

import static org.mockito.BDDMockito.given;
import static org.mockito.BDDMockito.then;

import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.watson.employees.Employee;
import com.watson.employees.EmployeesRepository;
import com.watson.employees.employees.getall.GetAllEmployees;
import com.watson.employees.employees.getall.GetAllEmployeesOutput;
import com.watson.employees.employees.getall.GetAllEmployeesRequest;
import com.watson.employees.employees.getall.GetAllEmployeesResponse;

@ExtendWith(MockitoExtension.class)
public class GetAllShould {

  @Mock
  private EmployeesRepository repository;
  @Mock
  private GetAllEmployeesOutput output;
  @InjectMocks
  private GetAllEmployees interactor;

  @Test
  public void returnAllEmployees() {
    List<Employee> employees = Arrays.asList(new Employee(1, "Darth Vader"),
        new Employee(2, "Luke Skywalker"));
    given(repository.findAll()).willReturn(employees);

    interactor.execute(new GetAllEmployeesRequest(), output);

    then(output).should().processResponse(new GetAllEmployeesResponse(employees));
  }
}
