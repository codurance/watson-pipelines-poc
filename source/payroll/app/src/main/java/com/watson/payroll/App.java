package com.watson.payroll;

import static spark.Spark.get;

import com.squareup.moshi.FromJson;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.ToJson;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import spark.Request;
import spark.Response;

public class App {

  public static void main(String[] args) {
    App app = new App();

    EmployeesRepository employeesRepository = new EmployeesRepository(
        app.constructEmployeesUrlFromEnvVars());
    PayrollRepository payrollRepository = new PayrollRepository();
    PayrollService service = new PayrollService(employeesRepository, payrollRepository);

    Moshi moshi =
        new Moshi.Builder()
            .add(new LocalDateAdapter())
            .build();

    get("/payroll/:id", (req, res) -> app.getPayrollForId(req, res, service, moshi));
  }

  private String constructEmployeesUrlFromEnvVars() {
    String protocol = System.getenv("EMPLOYEES_URL_PROTOCOL");
    String host = System.getenv("EMPLOYEES_URL_HOST");
    String port = System.getenv("EMPLOYEES_URL_PORT");
    String url = String.format("%s://%s:%s", protocol, host, port);

    System.out.println(String.format("EMPLOYEES URL => %s", url));
    return url;
  }

  private Object getPayrollForId(Request req, Response res, PayrollService service, Moshi moshi) {
    int id = Integer.parseInt(req.params(":id"));
    res.header("Content-Type", "application/json");
    PayrollReport report = service.getPayrollFor(id);
    return moshi.adapter(PayrollReport.class).toJson(report);
  }

  private static class LocalDateAdapter {

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE;

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
