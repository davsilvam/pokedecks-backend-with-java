package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public record CreateOrderRequestDTO(
        UUID userId,
        LocalDateTime orderTime,
        List<OrderItemRequestDTO> orderItems
) {
    public record OrderItemRequestDTO(
            String cardId,
            int quantity
    ) {
    }
}
