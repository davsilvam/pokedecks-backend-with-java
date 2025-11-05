package com.davsilvam.pokedecks.services.dtos;

import com.davsilvam.pokedecks.models.enums.UserRole;

import java.time.LocalDate;
import java.util.UUID;

public record UserResponseDTO(
        UUID id,
        String name,
        String username,
        String email,
        UserRole role,
        String phoneNumber,
        LocalDate birthDate,
        String address
) {
}
