package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.models.Set;
import com.davsilvam.pokedecks.models.daos.SerieDAO;
import com.davsilvam.pokedecks.models.daos.SetDAO;
import com.davsilvam.pokedecks.services.dtos.CreateSetRequestDTO;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UpdateSetRequestDTO;
import com.davsilvam.pokedecks.services.mappers.SetMapper;

import java.sql.SQLException;
import java.util.List;

public class SetService {
    private final SerieDAO serieDAO;
    private final SetDAO setDAO;

    public SetService(SerieDAO serieDAO, SetDAO setDAO) {
        this.serieDAO = serieDAO;
        this.setDAO = setDAO;
    }

    public SetResponseDTO createSet(CreateSetRequestDTO request) {
        try {
            if (request.id() == null || request.id().isBlank()) {
                throw new IllegalArgumentException("ID do set é obrigatório");
            }

            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome do set é obrigatório");
            }

            if (request.serieId() == null || request.serieId().isBlank()) {
                throw new IllegalArgumentException("ID da série é obrigatório");
            }

            if (request.releaseDate() == null) {
                throw new IllegalArgumentException("Data de lançamento é obrigatória");
            }

            if (setDAO.existsById(request.id())) {
                throw new ResourceConflictException("Set com ID " + request.id() + " já existe");
            }

            Serie serie = serieDAO.findById(request.serieId());

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + request.serieId());
            }

            Set set = new Set(
                    request.id(),
                    request.name(),
                    request.logoUrl(),
                    request.releaseDate(),
                    request.serieId()
            );

            Set saved = setDAO.save(set);
            return SetMapper.toDTO(saved);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao criar set", e);
        }
    }

    public SetResponseDTO updateSet(String id, UpdateSetRequestDTO request) {
        try {
            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome do set é obrigatório");
            }

            if (request.serieId() == null || request.serieId().isBlank()) {
                throw new IllegalArgumentException("ID da série é obrigatório");
            }

            if (request.releaseDate() == null) {
                throw new IllegalArgumentException("Data de lançamento é obrigatória");
            }

            Set set = setDAO.findById(id);

            if (set == null) {
                throw new ResourceNotFoundException("Set com ID " + id);
            }

            Serie serie = serieDAO.findById(request.serieId());

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + request.serieId());
            }

            set.setName(request.name());
            set.setLogoUrl(request.logoUrl());
            set.setReleaseDate(request.releaseDate());

            Set updated = setDAO.update(set);
            return SetMapper.toDTO(updated);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao atualizar set", e);
        }
    }

    public SetResponseDTO getSetById(String id) {
        try {
            Set set = setDAO.findById(id);

            if (set == null) {
                throw new ResourceNotFoundException("Coleção com ID " + id);
            }

            return SetMapper.toDTO(set);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar coleção com ID " + id, e);
        }
    }

    public List<SetResponseDTO> getAllSets() {
        try {
            return setDAO.findAll().stream()
                    .map(SetMapper::toDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar todas as coleções", e);
        }
    }

    public List<SetResponseDTO> getSetsBySerieId(String serieId) {
        try {
            Serie serie = serieDAO.findById(serieId);

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + serieId);
            }

            return setDAO.findBySerieId(serieId).stream()
                    .map(SetMapper::toDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar coleções da série com ID " + serieId, e);
        }
    }

    public void deleteSetById(String id) {
        try {
            Set set = setDAO.findById(id);

            if (set == null) {
                throw new ResourceNotFoundException("Coleção com ID " + id);
            }

            setDAO.deleteById(id);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao deletar coleção com ID " + id, e);
        }
    }
}

