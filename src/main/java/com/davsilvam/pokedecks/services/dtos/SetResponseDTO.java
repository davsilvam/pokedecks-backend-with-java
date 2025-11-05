package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDateTime;

public record SetResponseDTO(
        String id,
        String name,
        String logoUrl,
        LocalDateTime releaseDate,
        Integer totalCards
) {
}
