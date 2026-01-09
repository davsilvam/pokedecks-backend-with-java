package com.davsilvam.pokedecks.services.dtos;

import com.davsilvam.pokedecks.models.enums.CardCategory;

public record CreateCardRequestDTO(
        String id,
        Integer localId,
        String name,
        String imageUrl,
        String illustrator,
        String rarity,
        Double price,
        CardCategory category,
        String setId,
        Object metadata // PokemonMetadata, EnergyMetadata, ou TrainerMetadata
) {
    // Nested DTOs para metadados específicos de cada categoria
    public record PokemonMetadata(
            int dexId,
            int hp,
            String types, // Comma-separated: "Fire, Flying"
            String stage,
            String description,
            int level
    ) {
    }

    public record EnergyMetadata(
            String effect,
            String type
    ) {
    }

    public record TrainerMetadata(
            String effect,
            String type
    ) {
    }
}
