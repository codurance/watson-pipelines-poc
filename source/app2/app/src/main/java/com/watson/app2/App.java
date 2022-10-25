package com.watson.app2;

import static spark.Spark.get;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.squareup.moshi.FromJson;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.ToJson;
import spark.Request;
import spark.Response;

public class App {
    private static final String EMPLOYEES_URL = "EMPLOYEES_URL";

    public static void main(String[] args) {
        App app = new App();
        String url = "http://localhost:8080";
        EmployeesRepository employeesRepository = new EmployeesRepository(url);
        PayrollRepository payrollRepository = new PayrollRepository();
        PayrollService service = new PayrollService(employeesRepository, payrollRepository);

        Moshi moshi =
            new Moshi.Builder()
                .add(new LocalDateAdapter())
                .build();

        get("/payroll/:id", (req, res) -> app.getPayrollForId(req, res, service, moshi));
    }

    private Object getPayrollForId(Request req, Response res, PayrollService service, Moshi moshi) {
        int id = Integer.parseInt(req.params(":id"));
        res.header("Content-Type", "application/json");
        PayrollReport report = service.getPayrollFor(id);
        return moshi.adapter(PayrollReport.class).toJson(report);
    }

    private static class LocalDateAdapter {
        private static DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE;

        @ToJson
        public String toJson(LocalDate date) {
            return FORMATTER.format(date);
        }

        @FromJson
        public LocalDate FromJson(String value) {
            return LocalDate.from(FORMATTER.parse(value));
        }
    }
}
