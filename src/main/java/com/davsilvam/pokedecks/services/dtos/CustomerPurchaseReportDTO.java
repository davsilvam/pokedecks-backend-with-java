package com.davsilvam.pokedecks.services.dtos;

import java.util.UUID;

public record CustomerPurchaseReportDTO(
        UUID customerId,
        String customerName,
        Long totalPurchases
) {
}
