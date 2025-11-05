package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public record OrderResponseDTO(
        UUID id,
        LocalDateTime orderTime,
        UserResponseDTO user,
        List<OrderItemResponseDTO> orderItems,
        int totalItems,
        double totalPrice
) {
}
