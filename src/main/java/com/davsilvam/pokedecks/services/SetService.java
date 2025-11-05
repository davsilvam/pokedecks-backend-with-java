package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.models.Set;
import com.davsilvam.pokedecks.models.daos.SerieDAO;
import com.davsilvam.pokedecks.models.daos.SetDAO;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;
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

            // Usa método normal pois não precisa de eager loading aqui
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
