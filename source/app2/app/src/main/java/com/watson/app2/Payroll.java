package com.watson.app2;

import java.time.LocalDate;

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
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((date == null) ? 0 : date.hashCode());
        result = prime * result + employeeId;
        result = prime * result + amount;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Payroll other = (Payroll) obj;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        if (employeeId != other.employeeId)
            return false;
        if (amount != other.amount)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Payroll [date=" + date + ", employeeId=" + employeeId + ", amount=" + amount + "]";
    }
}
