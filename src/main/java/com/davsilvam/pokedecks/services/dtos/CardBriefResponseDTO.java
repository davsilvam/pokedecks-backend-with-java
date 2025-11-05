package com.davsilvam.pokedecks.services.dtos;

public record CardBriefResponseDTO(
        String id,
        String name,
        String imageUrl,
        Integer localId
) {
}
