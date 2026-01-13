package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDate;

public record DailyRevenueReportDTO(
        LocalDate date,
        Double totalRevenue
) {
}
