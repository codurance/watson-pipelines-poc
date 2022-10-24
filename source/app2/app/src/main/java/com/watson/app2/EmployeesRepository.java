package com.watson.app2;

import java.io.IOException;

import retrofit2.Retrofit;
import retrofit2.converter.moshi.MoshiConverterFactory;

public class EmployeesRepository {
    private final Retrofit retrofit;

    public EmployeesRepository(String url) {
        retrofit = 
            new Retrofit.Builder()
                .baseUrl(url)
                .addConverterFactory(MoshiConverterFactory.create())
                .build();
    }

    public Employee byId(int id) throws IOException {
        EmployeesRest rest = retrofit.create(EmployeesRest.class);
        return rest.byId(id).execute().body();
    }
}
