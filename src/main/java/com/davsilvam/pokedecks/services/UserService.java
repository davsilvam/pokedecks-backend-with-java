package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.models.daos.UserDAO;
import com.davsilvam.pokedecks.services.dtos.EditUserProfileRequestDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.services.mappers.UserMapper;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

public class UserService {
    private final UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public UserResponseDTO findById(UUID id) {
        try {
            User user = userDAO.findById(id);
            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + id);
            }
            return UserMapper.toDTO(user);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar usuário", e);
        }
    }

    public UserResponseDTO findByUsername(String username) {
        try {
            User user = userDAO.findByUsername(username);
            if (user == null) {
                throw new ResourceNotFoundException("Usuário com username " + username);
            }
            return UserMapper.toDTO(user);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar usuário", e);
        }
    }

    public UserResponseDTO findByEmail(String email) {
        try {
            User user = userDAO.findByEmail(email);

            if (user == null) {
                throw new ResourceNotFoundException("Usuário com email " + email);
            }

            return UserMapper.toDTO(user);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar usuário", e);
        }
    }

    public List<UserResponseDTO> findAll() {
        try {
            List<User> users = userDAO.findAll();
            return users.stream().map(UserMapper::toDTO).toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao listar usuários", e);
        }
    }

    public UserResponseDTO editProfile(UUID id, EditUserProfileRequestDTO dto) {
        try {
            User user = userDAO.findById(id);
            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + id);
            }

            user.setName(dto.name() != null ? dto.name() : user.getName());
            user.setEmail(dto.email() != null ? dto.email() : user.getEmail());
            user.setPhoneNumber(dto.phoneNumber() != null ? dto.phoneNumber() : user.getPhoneNumber());
            user.setBirthDate(dto.birthDate() != null ? dto.birthDate() : user.getBirthDate());
            user.setAddress(dto.address() != null ? dto.address() : user.getAddress());

            return UserMapper.toDTO(userDAO.save(user));
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao editar perfil", e);
        }
    }

    public void deleteAccount(UUID id) {
        try {
            User user = userDAO.findById(id);
            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + id);
            }
            userDAO.deleteById(id);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao deletar conta", e);
        }
    }
}
