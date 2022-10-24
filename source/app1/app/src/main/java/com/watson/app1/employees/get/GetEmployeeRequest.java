package com.watson.app1.employees.get;

import java.util.Objects;

public class GetEmployeeRequest {

  private final int id;

  public GetEmployeeRequest(int id) {
    this.id = id;
  }

  public int getId() {
    return id;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    GetEmployeeRequest that = (GetEmployeeRequest) o;
    return id == that.id;
  }

  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  @Override
  public String toString() {
    return "GetEmployeeRequest{" +
        "id=" + id +
        '}';
  }
}
