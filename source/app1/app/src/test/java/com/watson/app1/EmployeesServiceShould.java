package com.watson.app1;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.any;
import static org.mockito.BDDMockito.eq;
import static org.mockito.BDDMockito.willAnswer;

import com.watson.app1.employees.get.GetEmployeeInput;
import com.watson.app1.employees.get.GetEmployeeRequest;
import com.watson.app1.employees.get.GetEmployeeResponse;
import com.watson.app1.employees.getall.GetAllEmployeesInput;
import com.watson.app1.employees.getall.GetAllEmployeesResponse;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class EmployeesServiceShould {

  @Mock
  private GetAllEmployeesInput getAllEmployees;
  @Mock
  private GetEmployeeInput getEmployee;
  private EmployeeParser employeeParser;
  private EmployeesService service;

  @BeforeEach
  public void setup() {
    employeeParser = new EmployeeParser();
    service = new EmployeesService(getAllEmployees, getEmployee, employeeParser);
  }

  @Test
  public void getAllEmployees() throws Exception {
    GetAllEmployeesResponse expected = new GetAllEmployeesResponse(
        Arrays.asList(new Employee(1, "Ben Dover")));
    willAnswer(i -> {
      employeeParser.processResponse(expected);
      return null;
    }).given(getAllEmployees).execute(any(), eq(employeeParser));
    List<Employee> actual = service.getAll();

    assertThat(actual).hasSameElementsAs(expected.getEmployees());
  }

  @Test
  void getEmployee() {
    int id = 1;
    GetEmployeeResponse expected = new GetEmployeeResponse(new Employee(id, "Ben Dover"));
    willAnswer(i -> {
      employeeParser.processResponse(expected);
      return null;
    }).given(getEmployee).execute(new GetEmployeeRequest(id), employeeParser);
    Employee actual = service.getEmployee(id);

    assertThat(actual).isEqualTo(expected.getEmployee());
  }
}