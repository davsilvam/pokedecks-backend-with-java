package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.Set;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;

public class SetMapper {
    public static SetResponseDTO toDTO(Set set) {
        if (set == null) {
            return null;
        }

        return new SetResponseDTO(
                set.getId(),
                set.getName(),
                set.getLogoUrl(),
                set.getReleaseDate(),
                set.getCardCount()
        );
    }
}
