package com.davsilvam.pokedecks.services.dtos;

import java.util.UUID;

public record OrderItemResponseDTO(
        UUID id,
        int quantity,
        String cardId,
        String name,
        String imageUrl,
        Integer localId,
        double price
) {
}
