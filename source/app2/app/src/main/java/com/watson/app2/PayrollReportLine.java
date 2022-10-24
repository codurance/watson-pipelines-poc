package com.watson.app2;

import java.time.LocalDate;

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
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((date == null) ? 0 : date.hashCode());
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
        PayrollReportLine other = (PayrollReportLine) obj;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        if (amount != other.amount)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "PayrollReportLine [date=" + date + ", amount=" + amount + "]";
    }
}
