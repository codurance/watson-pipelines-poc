package com.watson.employees.employees.getall;

import static org.mockito.ArgumentMatchers.argThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.BDDMockito.then;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.watson.employees.Employee;
import com.watson.employees.EmployeesRepository;
import com.watson.employees.employees.EmployeeNotFound;
import com.watson.employees.employees.get.GetEmployee;
import com.watson.employees.employees.get.GetEmployeeOutput;
import com.watson.employees.employees.get.GetEmployeeRequest;
import com.watson.employees.employees.get.GetEmployeeResponse;

@ExtendWith(MockitoExtension.class)
public class GetEmployeeShould {

  @Mock
  private EmployeesRepository repository;
  @Mock
  private GetEmployeeOutput output;
  @InjectMocks
  private GetEmployee interactor;

  @Test
  void returnEmployeeById() {
    int id = 1;
    Employee employee = new Employee(id, "Ben Dover");
    given(repository.findById(id)).willReturn(employee);

    interactor.execute(new GetEmployeeRequest(id), output);

    then(output).should().processResponse(new GetEmployeeResponse(employee));
  }

  @Test
  void throwExceptionIfEmployeeDoesNotFound() {
    int id = 1;
    given(repository.findById(id)).willReturn(null);

    interactor.execute(new GetEmployeeRequest(id), output);

    then(output).should().processResponse(argThat((EmployeeNotFound e) -> e.getId() == id));
  }
}
