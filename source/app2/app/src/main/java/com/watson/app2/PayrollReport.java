package com.watson.app2;

import java.util.List;

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
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((lines == null) ? 0 : lines.hashCode());
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
        PayrollReport other = (PayrollReport) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (lines == null) {
            if (other.lines != null)
                return false;
        } else if (!lines.equals(other.lines))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "PayrollReport [name=" + name + ", lines=" + lines + "]";
    }
}
