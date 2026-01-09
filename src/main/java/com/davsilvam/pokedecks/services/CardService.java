package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.*;
import com.davsilvam.pokedecks.models.daos.*;
import com.davsilvam.pokedecks.models.enums.CardCategory;
import com.davsilvam.pokedecks.services.dtos.*;
import com.davsilvam.pokedecks.services.mappers.CardMapper;
import com.davsilvam.pokedecks.services.mappers.SetMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class CardService {
    private final SetDAO setDAO;
    private final CardDAO cardDAO;
    private final PokemonDAO pokemonDAO;
    private final EnergyDAO energyDAO;
    private final TrainerDAO trainerDAO;
    private final Gson gson;

    public CardService(SetDAO setDAO, CardDAO cardDAO, PokemonDAO pokemonDAO, EnergyDAO energyDAO, TrainerDAO trainerDAO) {
        this.setDAO = setDAO;
        this.cardDAO = cardDAO;
        this.pokemonDAO = pokemonDAO;
        this.energyDAO = energyDAO;
        this.trainerDAO = trainerDAO;
        this.gson = new Gson();
    }

    public CardResponseDTO createCard(CreateCardRequestDTO request) {
        try {
            if (request.id() == null || request.id().isBlank()) {
                throw new IllegalArgumentException("ID da carta é obrigatório");
            }

            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome da carta é obrigatório");
            }

            if (request.setId() == null || request.setId().isBlank()) {
                throw new IllegalArgumentException("ID do set é obrigatório");
            }

            if (request.category() == null) {
                throw new IllegalArgumentException("Categoria da carta é obrigatória");
            }

            if (request.metadata() == null) {
                throw new IllegalArgumentException("Metadados da carta são obrigatórios");
            }

            if (cardDAO.existsById(request.id())) {
                throw new ResourceConflictException("Carta com ID " + request.id() + " já existe");
            }

            Set set = setDAO.findById(request.setId());
            if (set == null) {
                throw new ResourceNotFoundException("Set com ID " + request.setId());
            }

            Card card = new Card(
                    request.id(),
                    request.localId(),
                    request.name(),
                    request.imageUrl(),
                    request.illustrator(),
                    request.rarity(),
                    request.price(),
                    request.category(),
                    request.setId()
            );

            Card savedCard = cardDAO.save(card);

            Object details = saveCardMetadata(savedCard.getId(), request.category(), request.metadata());

            return mapToResponseDTO(savedCard, details);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao criar carta", e);
        }
    }

    public CardResponseDTO updateCard(String id, UpdateCardRequestDTO request) {
        try {
            if (request.name() == null || request.name().isBlank()) {
                throw new IllegalArgumentException("Nome da carta é obrigatório");
            }

            if (request.setId() == null || request.setId().isBlank()) {
                throw new IllegalArgumentException("ID do set é obrigatório");
            }

            if (request.category() == null) {
                throw new IllegalArgumentException("Categoria da carta é obrigatória");
            }

            if (request.metadata() == null) {
                throw new IllegalArgumentException("Metadados da carta são obrigatórios");
            }

            Card card = cardDAO.findById(id);

            if (card == null) {
                throw new ResourceNotFoundException("Carta com ID " + id);
            }

            Set set = setDAO.findById(request.setId());

            if (set == null) {
                throw new ResourceNotFoundException("Set com ID " + request.setId());
            }

            card.setLocalId(request.localId());
            card.setName(request.name());
            card.setImageUrl(request.imageUrl());
            card.setIllustrator(request.illustrator());
            card.setRarity(request.rarity());
            card.setPrice(request.price());
            card.setCategory(request.category());

            Card updated = cardDAO.update(card);

            Object details = updateCardMetadata(updated.getId(), request.category(), request.metadata());

            return mapToResponseDTO(updated, details);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao atualizar carta", e);
        }
    }

    private Object saveCardMetadata(String cardId, CardCategory category, Object metadata) throws SQLException {
        JsonObject json = gson.toJsonTree(metadata).getAsJsonObject();

        return switch (category) {
            case POKEMON -> {
                Pokemon pokemon = new Pokemon(
                        cardId,
                        json.get("dexId").getAsInt(),
                        json.get("hp").getAsInt(),
                        json.get("types").getAsString(),
                        json.get("stage").getAsString(),
                        json.has("description") && !json.get("description").isJsonNull()
                                ? json.get("description").getAsString()
                                : null,
                        json.get("level").getAsInt()
                );
                yield pokemonDAO.save(pokemon);
            }
            case ENERGY -> {
                Energy energy = new Energy(
                        cardId,
                        json.get("effect").getAsString(),
                        json.get("type").getAsString()
                );
                yield energyDAO.save(energy);
            }
            case TRAINER -> {
                Trainer trainer = new Trainer(
                        cardId,
                        json.get("effect").getAsString(),
                        json.get("type").getAsString()
                );
                yield trainerDAO.save(trainer);
            }
        };
    }

    private Object updateCardMetadata(String cardId, CardCategory category, Object metadata) throws SQLException {
        JsonObject json = gson.toJsonTree(metadata).getAsJsonObject();

        return switch (category) {
            case POKEMON -> {
                Pokemon pokemon = new Pokemon(
                        cardId,
                        json.get("dexId").getAsInt(),
                        json.get("hp").getAsInt(),
                        json.get("types").getAsString(),
                        json.get("stage").getAsString(),
                        json.has("description") && !json.get("description").isJsonNull()
                                ? json.get("description").getAsString()
                                : null,
                        json.get("level").getAsInt()
                );
                yield pokemonDAO.update(pokemon);
            }
            case ENERGY -> {
                Energy energy = new Energy(
                        cardId,
                        json.get("effect").getAsString(),
                        json.get("type").getAsString()
                );
                yield energyDAO.update(energy);
            }
            case TRAINER -> {
                Trainer trainer = new Trainer(
                        cardId,
                        json.get("effect").getAsString(),
                        json.get("type").getAsString()
                );
                yield trainerDAO.update(trainer);
            }
        };
    }

    private CardResponseDTO mapToResponseDTO(Card card, Object details) {
        return switch (card.getCategory()) {
            case POKEMON -> CardMapper.toCardResponseDTO(card, (Pokemon) details);
            case ENERGY -> CardMapper.toCardResponseDTO(card, (Energy) details);
            case TRAINER -> CardMapper.toCardResponseDTO(card, (Trainer) details);
        };
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

