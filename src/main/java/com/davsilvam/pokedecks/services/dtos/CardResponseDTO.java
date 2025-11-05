package com.davsilvam.pokedecks.services.dtos;

import com.davsilvam.pokedecks.models.enums.CardCategory;

import java.util.List;

public record CardResponseDTO(
        String id,
        Integer localId,
        String name,
        String imageUrl,
        String illustrator,
        String rarity,
        Double price,
        CardCategory category,
        Object metadata
) {
    public record PokemonMetadata(
            int dexId,
            int hp,
            List<String> types,
            String stage,
            String description,
            int level
    ) {
    }

    public record TrainerMetadata(
            String effect,
            String type
    ) {
    }

    public record EnergyMetadata(
            String effect,
            String type
    ) {
    }
}
