package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.models.daos.SerieDAO;
import com.davsilvam.pokedecks.services.dtos.CreateSerieRequestDTO;
import com.davsilvam.pokedecks.services.dtos.SerieResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UpdateSerieRequestDTO;
import com.davsilvam.pokedecks.services.mappers.SerieMapper;

import java.sql.SQLException;
import java.util.List;

public class SerieService {
    private final SerieDAO serieDAO;

    public SerieService(SerieDAO serieDAO) {
        this.serieDAO = serieDAO;
    }

    public SerieResponseDTO createSerie(CreateSerieRequestDTO request) {
        try {
            if (request.id() == null || request.id().isBlank()) {
                throw new IllegalArgumentException("ID da série é obrigatório");
            }

            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome da série é obrigatório");
            }

            if (serieDAO.existsById(request.id())) {
                throw new ResourceConflictException("Série com ID " + request.id() + " já existe");
            }

            Serie serie = new Serie(
                    request.id(),
                    request.name(),
                    request.logoUrl()
            );

            Serie saved = serieDAO.save(serie);
            return SerieMapper.toDTO(saved);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao criar série", e);
        }
    }

    public SerieResponseDTO updateSerie(String id, UpdateSerieRequestDTO request) {
        try {
            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome da série é obrigatório");
            }

            Serie serie = serieDAO.findById(id);

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + id);
            }

            serie.setName(request.name());
            serie.setLogoUrl(request.logoUrl());

            Serie updated = serieDAO.update(serie);
            return SerieMapper.toDTO(updated);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao atualizar série", e);
        }
    }

    public SerieResponseDTO getSerieById(String id) {
        try {
            Serie serie = serieDAO.findById(id);

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + id);
            }

            return SerieMapper.toDTO(serie);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar série com ID " + id, e);
        }
    }

    public List<SerieResponseDTO> getAllSeries() {
        try {
            return serieDAO.findAll().stream()
                    .map(SerieMapper::toDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar todas as séries", e);
        }
    }

    public void deleteSerieById(String id) {
        try {
            Serie serie = serieDAO.findById(id);

            if (serie == null) {
                throw new ResourceNotFoundException("Série com ID " + id);
            }

            serieDAO.deleteById(id);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao deletar série com ID " + id, e);
        }
    }
}

