package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.*;
import com.davsilvam.pokedecks.models.daos.*;
import com.davsilvam.pokedecks.services.dtos.CardBriefResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CardResponseDTO;
import com.davsilvam.pokedecks.services.dtos.SetWithCardsResponseDTO;
import com.davsilvam.pokedecks.services.mappers.CardMapper;
import com.davsilvam.pokedecks.services.mappers.SetMapper;

import java.sql.SQLException;
import java.util.List;

public class CardService {
    private final SetDAO setDAO;
    private final CardDAO cardDAO;

    public CardService(SetDAO setDAO, CardDAO cardDAO, PokemonDAO pokemonDAO, EnergyDAO energyDAO, TrainerDAO trainerDAO) {
        this.setDAO = setDAO;
        this.cardDAO = cardDAO;
    }

    public CardResponseDTO getCardById(String id) {
        try {
            CardDAO.CardWithDetails cardWithDetails = cardDAO.findByIdWithDetails(id);

            if (cardWithDetails == null) {
                throw new ResourceNotFoundException("Carta com ID " + id);
            }

            return mapCardWithDetailsToResponseDTO(cardWithDetails);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar carta com ID " + id, e);
        }
    }

    public List<CardBriefResponseDTO> getAllCards() {
        try {
            return cardDAO.findAll().stream()
                    .map(CardMapper::toCardBriefResponseDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar todas as cartas", e);
        }
    }

    public SetWithCardsResponseDTO getCardsBySetId(String setId) {
        try {
            Set set = setDAO.findById(setId);

            if (set == null) {
                throw new ResourceNotFoundException("Coleção com ID " + setId);
            }

            return new SetWithCardsResponseDTO(
                    SetMapper.toDTO(set),
                    cardDAO.findBySetId(setId).stream()
                            .map(CardMapper::toCardBriefResponseDTO)
                            .toList());
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar cartas da coleção com ID " + setId, e);
        }
    }

    public List<CardBriefResponseDTO> searchCardsByName(String name) {
        try {
            return cardDAO.findByNameContainingIgnoreCase(name).stream()
                    .map(CardMapper::toCardBriefResponseDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar cartas com nome contendo " + name, e);
        }
    }

    public void deleteCardById(String id) {
        try {
            Card card = cardDAO.findById(id);

            if (card == null) {
                throw new ResourceNotFoundException("Carta com ID " + id);
            }

            cardDAO.deleteById(id);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao deletar carta com ID " + id, e);
        }
    }

    private CardResponseDTO mapCardWithDetailsToResponseDTO(CardDAO.CardWithDetails cardWithDetails) {
        Card card = cardWithDetails.card;
        Object details = cardWithDetails.details;

        return switch (card.getCategory()) {
            case POKEMON -> CardMapper.toCardResponseDTO(card, (Pokemon) details);
            case ENERGY -> CardMapper.toCardResponseDTO(card, (Energy) details);
            case TRAINER -> CardMapper.toCardResponseDTO(card, (Trainer) details);
            default -> null;
        };
    }
}
