package com.watson.app2;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PayrollRepository {
    private final List<Payroll> payrolls = 
        Arrays.asList(
                new Payroll(LocalDate.of(2022, 9, 1), 1, 3000),
                new Payroll(LocalDate.of(2022, 9, 1), 2, 1000),
                new Payroll(LocalDate.of(2022, 9, 1), 3, 30000),
                new Payroll(LocalDate.of(2022, 8, 1), 1, 2500),
                new Payroll(LocalDate.of(2022, 8, 1), 2, 300),
                new Payroll(LocalDate.of(2022, 8, 1), 3, 13000000));

    public List<Payroll> byEmployee(int id) {
        return payrolls.stream()
            .filter(p -> p.getEmployeeId() == id)
            .collect(Collectors.toList());
    }
}
