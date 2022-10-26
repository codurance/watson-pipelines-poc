package com.watson.payroll;

import java.time.LocalDate;
import java.util.Objects;

public class Payroll {

  private final LocalDate date;
  private final int employeeId;
  private final int amount;

  public Payroll(LocalDate date, int employeeId, int amount) {
    this.date = date;
    this.employeeId = employeeId;
    this.amount = amount;
  }

  public LocalDate getDate() {
    return date;
  }

  public int getEmployeeId() {
    return employeeId;
  }

  public int getAmount() {
    return amount;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Payroll payroll = (Payroll) o;
    return getEmployeeId() == payroll.getEmployeeId() && getAmount() == payroll.getAmount()
        && Objects.equals(getDate(), payroll.getDate());
  }

  @Override
  public int hashCode() {
    return Objects.hash(getDate(), getEmployeeId(), getAmount());
  }

  @Override
  public String toString() {
    return "Payroll{" +
        "date=" + date +
        ", employeeId=" + employeeId +
        ", amount=" + amount +
        '}';
  }
}
