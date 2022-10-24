package com.watson.app2;

import java.util.List;
import java.util.stream.Collectors;

public class PayrollService {
    private final EmployeesRepository employeesRepository;
    private final PayrollRepository payrollRepository;

    public PayrollService(EmployeesRepository employeesRepository, PayrollRepository payrollRepository) {
        this.employeesRepository = employeesRepository;
        this.payrollRepository = payrollRepository;
    }



    public PayrollReport getPayrollFor(int id) {
        try {
        Employee employee = employeesRepository.byId(id);
        List<Payroll> payrolls = payrollRepository.byEmployee(id);
        return new PayrollReport(
                employee.getName(),
                payrolls.stream()
                    .map(p -> new PayrollReportLine(p.getDate(), p.getAmount()))
                    .collect(Collectors.toList()));
        } catch(Exception e) {
            return null;
        }
    }
}
