package com.davsilvam.pokedecks.services.dtos;

import java.time.LocalDate;

public record EditUserProfileRequestDTO(
        String name,
        String username,
        String email,
        String phoneNumber,
        LocalDate birthDate,
        String address
) {
}
