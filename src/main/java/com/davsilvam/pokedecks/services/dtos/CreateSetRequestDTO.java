package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDateTime;

public record CreateSetRequestDTO(
        String id,
        String name,
        String logoUrl,
        LocalDateTime releaseDate,
        String serieId
) {
}
