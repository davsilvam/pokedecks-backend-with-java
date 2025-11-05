package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;

public class UserMapper {
    public static UserResponseDTO toDTO(User user) {
        if (user == null) {
            return null;
        }

        return new UserResponseDTO(
                user.getId(),
                user.getName(),
                user.getUsername(),
                user.getEmail(),
                user.getRole(),
                user.getPhoneNumber(),
                user.getBirthDate(),
                user.getAddress()
        );
    }
}
