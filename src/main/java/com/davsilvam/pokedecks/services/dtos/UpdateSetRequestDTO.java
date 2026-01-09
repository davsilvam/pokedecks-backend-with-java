package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDateTime;

public record UpdateSetRequestDTO(
        String name,
        String logoUrl,
        LocalDateTime releaseDate,
        String serieId
) {
}
