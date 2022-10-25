package com.watson.app2;

import java.time.LocalDate;
import java.util.Objects;

public class PayrollReportLine {

  private final LocalDate date;
  private final int amount;

  public PayrollReportLine(LocalDate date, int amount) {
    this.date = date;
    this.amount = amount;
  }

  public LocalDate getDate() {
    return date;
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
    PayrollReportLine that = (PayrollReportLine) o;
    return getAmount() == that.getAmount() && Objects.equals(getDate(), that.getDate());
  }

  @Override
  public int hashCode() {
    return Objects.hash(getDate(), getAmount());
  }

  @Override
  public String toString() {
    return "PayrollReportLine{" +
        "date=" + date +
        ", amount=" + amount +
        '}';
  }
}
