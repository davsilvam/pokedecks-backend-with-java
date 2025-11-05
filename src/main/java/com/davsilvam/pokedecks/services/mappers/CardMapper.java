package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.Card;
import com.davsilvam.pokedecks.models.Energy;
import com.davsilvam.pokedecks.models.Pokemon;
import com.davsilvam.pokedecks.models.Trainer;
import com.davsilvam.pokedecks.services.dtos.CardBriefResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CardResponseDTO;

import java.util.List;

public class CardMapper {
    public static CardResponseDTO toCardResponseDTO(Card card, Pokemon pokemon) {
        if (card == null) {
            return null;
        }

        return new CardResponseDTO(
                card.getId(),
                card.getLocalId(),
                card.getName(),
                card.getImageUrl(),
                card.getIllustrator(),
                card.getRarity(),
                card.getPrice(),
                card.getCategory(),
                new CardResponseDTO.PokemonMetadata(
                        pokemon.getDexId(),
                        pokemon.getHp(),
                        List.of(pokemon.getTypes().split(", ")),
                        pokemon.getStage(),
                        pokemon.getDescription(),
                        pokemon.getLevel()
                )
        );
    }

    public static CardResponseDTO toCardResponseDTO(Card card, Energy energy) {
        if (card == null) {
            return null;
        }

        return new CardResponseDTO(
                card.getId(),
                card.getLocalId(),
                card.getName(),
                card.getImageUrl(),
                card.getIllustrator(),
                card.getRarity(),
                card.getPrice(),
                card.getCategory(),
                new CardResponseDTO.EnergyMetadata(
                        energy.getEffect(),
                        energy.getType()
                )
        );
    }

    public static CardResponseDTO toCardResponseDTO(Card card, Trainer trainer) {
        if (card == null) {
            return null;
        }

        return new CardResponseDTO(
                card.getId(),
                card.getLocalId(),
                card.getName(),
                card.getImageUrl(),
                card.getIllustrator(),
                card.getRarity(),
                card.getPrice(),
                card.getCategory(),
                new CardResponseDTO.TrainerMetadata(
                        trainer.getEffect(),
                        trainer.getType()
                )
        );
    }

    public static CardBriefResponseDTO toCardBriefResponseDTO(Card card) {
        if (card == null) {
            return null;
        }

        return new CardBriefResponseDTO(
                card.getId(),
                card.getName(),
                card.getImageUrl(),
                card.getLocalId()
        );
    }
}
