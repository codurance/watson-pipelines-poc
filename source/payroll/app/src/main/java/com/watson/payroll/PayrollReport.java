package com.watson.payroll;

import java.util.List;
import java.util.Objects;

public class PayrollReport {

  private final String name;
  private final List<PayrollReportLine> lines;

  public PayrollReport(String name, List<PayrollReportLine> lines) {
    this.name = name;
    this.lines = lines;
  }

  public String getName() {
    return name;
  }

  public List<PayrollReportLine> getLines() {
    return lines;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    PayrollReport that = (PayrollReport) o;
    return Objects.equals(getName(), that.getName()) && Objects.equals(getLines(),
        that.getLines());
  }

  @Override
  public int hashCode() {
    return Objects.hash(getName(), getLines());
  }

  @Override
  public String toString() {
    return "PayrollReport{" +
        "name='" + name + '\'' +
        ", lines=" + lines +
        '}';
  }
}
