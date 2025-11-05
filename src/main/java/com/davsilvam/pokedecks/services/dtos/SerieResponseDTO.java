package com.davsilvam.pokedecks.services.dtos;

public record SerieResponseDTO(
        String id,
        String name,
        String logoUrl,
        Integer totalSets
) {
}
