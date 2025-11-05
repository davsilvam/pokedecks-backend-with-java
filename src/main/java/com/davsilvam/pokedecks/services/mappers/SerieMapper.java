package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.services.dtos.SerieResponseDTO;

public class SerieMapper {
    public static SerieResponseDTO toDTO(Serie serie) {
        if (serie == null) {
            return null;
        }

        return new SerieResponseDTO(
                serie.getId(),
                serie.getName(),
                serie.getLogoUrl(),
                serie.getSetCount()
        );
    }
}
