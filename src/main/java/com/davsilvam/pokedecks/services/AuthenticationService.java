package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.auth.JwtUtil;
import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.models.daos.UserDAO;
import com.davsilvam.pokedecks.models.enums.UserRole;
import com.davsilvam.pokedecks.services.dtos.AuthenticateResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CreateUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.LoginUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.services.mappers.UserMapper;
import com.davsilvam.pokedecks.util.PasswordUtil;

import java.sql.SQLException;
import java.util.UUID;

public class AuthenticationService {
    private final UserDAO userDAO;

    public AuthenticationService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public UserResponseDTO register(CreateUserRequestDTO request) {
        try {
            User existingByUsername = userDAO.findByUsername(request.username());
            if (existingByUsername != null) {
                throw new ResourceConflictException("Username " + request.username() + " já está em uso");
            }

            User existingByEmail = userDAO.findByEmail(request.email());
            if (existingByEmail != null) {
                throw new ResourceConflictException("Email " + request.email() + " já está em uso");
            }

            User user = new User(
                    UUID.randomUUID(),
                    request.name(),
                    request.username(),
                    request.email(),
                    PasswordUtil.hash(request.password()),
                    UserRole.USER,
                    null,
                    null,
                    null
            );

            User savedUser = userDAO.save(user);
            return UserMapper.toDTO(savedUser);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao registrar usuário", e);
        }
    }

    public AuthenticateResponseDTO authenticate(LoginUserRequestDTO request) {
        try {
            User user = userDAO.findByEmail(request.email());

            if (user == null) {
                throw new SecurityException("Credenciais inválidas");
            }

            if (!PasswordUtil.compare(request.password(), user.getPasswordHash())) {
                throw new SecurityException("Credenciais inválidas");
            }

            String token = JwtUtil.generateToken(user.getEmail(), user.getRole().name());
            return new AuthenticateResponseDTO(token);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao autenticar usuário", e);
        }
    }
}
