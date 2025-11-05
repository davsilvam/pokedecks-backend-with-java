package com.davsilvam.pokedecks.services.dtos;

import java.util.List;

public record SetWithCardsResponseDTO(
        SetResponseDTO set,
        List<CardBriefResponseDTO> cards
) {
}
