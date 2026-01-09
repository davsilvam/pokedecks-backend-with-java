package com.davsilvam.pokedecks.services.dtos;

public record CreateSerieRequestDTO(
        String id,
        String name,
        String logoUrl
) {
}
