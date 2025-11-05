package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.*;
import com.davsilvam.pokedecks.models.enums.CardCategory;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CardDAO implements DAO<Card, String> {
    private final DatabaseConnection db;
    private final PokemonDAO pokemonDAO;
    private final EnergyDAO energyDAO;
    private final TrainerDAO trainerDAO;

    public CardDAO(DatabaseConnection db) {
        this.db = db;
        this.pokemonDAO = new PokemonDAO(db);
        this.energyDAO = new EnergyDAO(db);
        this.trainerDAO = new TrainerDAO(db);
    }

    @Override
    public Card save(Card card) throws SQLException {
        String queryStr = "INSERT INTO cards (id, local_id, name, image_url, illustrator, rarity, price, category, set_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Logger.sql(queryStr, card.getId(), card.getLocalId(), card.getName(), card.getImageUrl(), card.getIllustrator(), card.getRarity(), card.getPrice(), card.getCategory(), card.getSetId());

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, card.getId());

            if (card.getLocalId() != null) {
                pstmt.setInt(2, card.getLocalId());
            } else {
                pstmt.setNull(2, Types.INTEGER);
            }

            pstmt.setString(3, card.getName());
            pstmt.setString(4, card.getImageUrl());
            pstmt.setString(5, card.getIllustrator());
            pstmt.setString(6, card.getRarity());
            pstmt.setDouble(7, card.getPrice());
            pstmt.setString(8, card.getCategory() != null ? card.getCategory().name() : null);
            pstmt.setString(9, card.getSetId());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                Logger.debug("Carta salva: %s", card.getId());
                return card;
            }

            throw new SQLException("Failed to save the card.");
        }
    }

    @Override
    public Card findById(String id) throws SQLException {
        String queryStr = "SELECT * FROM cards WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, id);

            try (ResultSet result = pstmt.executeQuery()) {
                if (result.next()) {
                    return buildCardFromResultSet(result);
                }
            }
        }

        return null;
    }

    public CardWithDetails findByIdWithDetails(String id) throws SQLException {
        Card card = findById(id);
        if (card == null) return null;

        return loadCardDetails(card);
    }

    public List<Card> findBySetId(String setId) throws SQLException {
        String queryStr = "SELECT * FROM cards WHERE set_id = ?";
        Logger.sql(queryStr, setId);
        List<Card> cards = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, setId);

            try (ResultSet result = pstmt.executeQuery()) {
                while (result.next()) {
                    Card card = buildCardFromResultSet(result);
                    cards.add(card);
                }
            }
        }

        Logger.debug("Encontradas %d cartas no set %s", cards.size(), setId);
        return cards;
    }

    public List<Card> findByNameContainingIgnoreCase(String name) throws SQLException {
        String queryStr = "SELECT * FROM cards WHERE LOWER(name) LIKE LOWER(?)";
        Logger.sql(queryStr, "%" + name + "%");
        List<Card> cards = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, "%" + name + "%");

            try (ResultSet result = pstmt.executeQuery()) {
                while (result.next()) {
                    Card card = buildCardFromResultSet(result);
                    cards.add(card);
                }
            }
        }

        Logger.debug("Encontradas %d cartas com nome '%s'", cards.size(), name);
        return cards;
    }

    @Override
    public List<Card> findAll() throws SQLException {
        String queryStr = "SELECT * FROM cards";
        Logger.sql(queryStr);
        List<Card> cards = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(queryStr)
        ) {
            while (result.next()) {
                Card card = buildCardFromResultSet(result);
                cards.add(card);
            }
        }

        Logger.debug("Encontradas %d cartas", cards.size());
        return cards;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String queryStr = "SELECT 1 FROM cards WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, id);

            try (ResultSet result = pstmt.executeQuery()) {
                return result.next();
            }
        }
    }

    @Override
    public int count() throws SQLException {
        String queryStr = "SELECT COUNT(*) FROM cards";
        Logger.sql(queryStr);

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(queryStr)
        ) {
            if (result.next()) {
                return result.getInt(1);
            }

            return 0;
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String queryStr = "DELETE FROM cards WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, id);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Failed to delete card, no rows affected.");
            }

            Logger.debug("Carta deletada: %s", id);
        }
    }

    private CardWithDetails loadCardDetails(Card card) throws SQLException {
        Object details = null;

        switch (card.getCategory()) {
            case POKEMON -> details = pokemonDAO.findByCardId(card.getId());
            case ENERGY -> details = energyDAO.findByCardId(card.getId());
            case TRAINER -> details = trainerDAO.findByCardId(card.getId());
        }

        return new CardWithDetails(card, details);
    }

    private Card buildCardFromResultSet(ResultSet result) throws SQLException {
        String cardId = result.getString("id");
        Integer localId = result.getObject("local_id", Integer.class);
        String name = result.getString("name");
        String imageUrl = result.getString("image_url");
        String illustrator = result.getString("illustrator");
        String rarity = result.getString("rarity");
        Double price = result.getDouble("price");
        String categoryStr = result.getString("category");
        CardCategory category = categoryStr != null ? CardCategory.valueOf(categoryStr) : null;
        String setId = result.getString("set_id");

        return new Card(cardId, localId, name, imageUrl, illustrator, rarity, price, category, setId);
    }

    public static class CardWithDetails {
        public final Card card;
        public final Object details; // Pokemon, Energy ou Trainer

        public CardWithDetails(Card card, Object details) {
            this.card = card;
            this.details = details;
        }
    }
}
