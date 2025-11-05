package com.davsilvam.pokedecks.services.dtos;

public record LoginUserRequestDTO(
        String email,
        String password
) {
}
