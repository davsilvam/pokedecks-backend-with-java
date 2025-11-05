package com.davsilvam.pokedecks.services.dtos;

public record CreateUserRequestDTO(
        String name,
        String username,
        String email,
        String password
) {
}
