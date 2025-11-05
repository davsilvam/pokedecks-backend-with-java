package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.models.daos.SerieDAO;
import com.davsilvam.pokedecks.services.dtos.SerieResponseDTO;
import com.davsilvam.pokedecks.services.mappers.SerieMapper;

import java.sql.SQLException;
import java.util.List;

public class SerieService {
    private final SerieDAO serieDAO;

    public SerieService(SerieDAO serieDAO) {
        this.serieDAO = serieDAO;
    }

    public SerieResponseDTO getSerieById(String id) {
        try {
            // Sem eager loading pois não retorna sets nested no DTO
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
            // Sem eager loading pois não retorna sets nested no DTO
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
