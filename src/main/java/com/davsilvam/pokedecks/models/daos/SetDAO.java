package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Card;
import com.davsilvam.pokedecks.models.Set;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class SetDAO implements DAO<Set, String> {
    private final DatabaseConnection db;
    private final CardDAO cardDAO;

    public SetDAO(DatabaseConnection db) {
        this.db = db;
        this.cardDAO = new CardDAO(db);
    }

    @Override
    public Set save(Set set) throws SQLException {
        String query = "INSERT INTO sets (id, name, logo_url, release_date, serie_id) VALUES (?, ?, ?, ?, ?)";
        Logger.sql(query, set.getId(), set.getName(), set.getLogoUrl(), set.getReleaseDate(), set.getSerieId());

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, set.getId());
            pstmt.setString(2, set.getName());
            pstmt.setString(3, set.getLogoUrl());

            if (set.getReleaseDate() != null) {
                pstmt.setTimestamp(4, Timestamp.valueOf(set.getReleaseDate()));
            } else {
                pstmt.setNull(4, Types.TIMESTAMP);
            }

            pstmt.setString(5, set.getSerieId());

            int affected = pstmt.executeUpdate();

            if (affected > 0) {
                Logger.debug("Set salvo: %s", set.getId());
                return set;
            }

            throw new SQLException("Failed to save set.");
        }
    }

    @Override
    public Set findById(String id) throws SQLException {
        String query = "SELECT s.*, COUNT(c.id) as cards_count " +
                      "FROM sets s " +
                      "LEFT JOIN cards c ON s.id = c.set_id " +
                      "WHERE s.id = ? " +
                      "GROUP BY s.id, s.name, s.logo_url, s.release_date, s.serie_id";
        Logger.sql(query, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Set set = buildSetFromResultSet(rs);
                    int count = rs.getInt("cards_count");
                    set.setCardCount(count);
                    return set;
                }
            }
        }

        return null;
    }

    public Set findByIdWithCards(String id) throws SQLException {
        Set set = findById(id);
        if (set == null) return null;

        return loadSetCards(set);
    }

    public List<Set> findBySerieId(String serieId) throws SQLException {
        String query = "SELECT s.*, COUNT(c.id) as cards_count " +
                      "FROM sets s " +
                      "LEFT JOIN cards c ON s.id = c.set_id " +
                      "WHERE s.serie_id = ? " +
                      "GROUP BY s.id, s.name, s.logo_url, s.release_date, s.serie_id";
        Logger.sql(query, serieId);
        List<Set> list = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, serieId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Set set = buildSetFromResultSet(rs);
                    int count = rs.getInt("cards_count");
                    set.setCardCount(count);
                    list.add(set);
                }
            }
        }

        Logger.debug("Encontrados %d sets para série %s", list.size(), serieId);
        return list;
    }

    public List<Set> findBySerieIdWithCards(String serieId) throws SQLException {
        List<Set> sets = findBySerieId(serieId);

        for (Set set : sets) {
            loadSetCards(set);
        }

        return sets;
    }

    @Override
    public List<Set> findAll() throws SQLException {
        String query = "SELECT s.*, COUNT(c.id) as cards_count " +
                      "FROM sets s " +
                      "LEFT JOIN cards c ON s.id = c.set_id " +
                      "GROUP BY s.id, s.name, s.logo_url, s.release_date, s.serie_id";
        Logger.sql(query);
        List<Set> list = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)
        ) {
            while (rs.next()) {
                Set set = buildSetFromResultSet(rs);
                int count = rs.getInt("cards_count");
                set.setCardCount(count);
                list.add(set);
            }
        }

        Logger.debug("Encontrados %d sets", list.size());
        return list;
    }

    public List<Set> findAllWithCards() throws SQLException {
        List<Set> sets = findAll();

        for (Set set : sets) {
            loadSetCards(set);
        }

        return sets;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String query = "SELECT 1 FROM sets WHERE id = ?";
        Logger.sql(query, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    @Override
    public int count() throws SQLException {
        String query = "SELECT COUNT(*) FROM sets";
        Logger.sql(query);

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0;
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String query = "DELETE FROM sets WHERE id = ?";
        Logger.sql(query, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {

            pstmt.setString(1, id);

            int affected = pstmt.executeUpdate();

            if (affected == 0) {
                throw new SQLException("Failed to delete set, no rows affected.");
            }

            Logger.debug("Set deletado: %s", id);
        }
    }

    /**
     * Carrega as Cards do Set via eager loading
     */
    private Set loadSetCards(Set set) throws SQLException {
        List<Card> cards = cardDAO.findBySetId(set.getId());
        set.setCards(cards);

        Logger.debug("Carregadas %d cards para o set %s", cards.size(), set.getId());
        return set;
    }

    private Set buildSetFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String logoUrl = rs.getString("logo_url");
        Timestamp ts = rs.getTimestamp("release_date");
        LocalDateTime releaseDate = ts != null ? ts.toLocalDateTime() : null;
        String serieId = rs.getString("serie_id");

        return new Set(id, name, logoUrl, releaseDate, serieId);
    }
}
