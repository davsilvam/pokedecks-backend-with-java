package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Pokemon;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PokemonDAO implements DAO<Pokemon, String> {
    private final DatabaseConnection db;

    public PokemonDAO(DatabaseConnection db) {
        this.db = db;
    }

    @Override
    public Pokemon save(Pokemon pokemon) throws SQLException {
        String queryStr = "INSERT INTO pokemons (card_id, dex_id, hp, types, stage, description, level) VALUES (?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, pokemon.getId());
                pstmt.setInt(2, pokemon.getDexId());
                pstmt.setInt(3, pokemon.getHp());
                pstmt.setString(4, pokemon.getTypes());
                pstmt.setString(5, pokemon.getStage());
                pstmt.setString(6, pokemon.getDescription());
                pstmt.setInt(7, pokemon.getLevel());

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows > 0) {
                    return pokemon;
                }

                throw new SQLException("Failed to save the pokemon card.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public Pokemon findById(String id) throws SQLException {
        String queryStr = "SELECT * FROM pokemons WHERE card_id = ?";
        Pokemon pokemon = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        pokemon = buildPokemonFromResultSet(result);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return pokemon;
    }

    public Pokemon findByCardId(String cardId) throws SQLException {
        String queryStr = "SELECT p.* FROM pokemons p JOIN cards c ON p.card_id = c.id WHERE c.id = ?";
        Pokemon pokemon = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, cardId);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        pokemon = buildPokemonFromResultSet(result);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return pokemon;
    }

    @Override
    public List<Pokemon> findAll() throws SQLException {
        String queryStr = "SELECT * FROM pokemons";
        List<Pokemon> pokemons = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(queryStr)) {
                while (result.next()) {
                    Pokemon pokemon = buildPokemonFromResultSet(result);
                    pokemons.add(pokemon);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return pokemons;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String queryStr = "SELECT 1 FROM pokemons WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    return result.next();
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public int count() throws SQLException {
        String queryStr = "SELECT COUNT(*) FROM pokemons";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(queryStr)) {
                if (result.next()) {
                    return result.getInt(1);
                }

                return 0;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    public Pokemon update(Pokemon pokemon) throws SQLException {
        String queryStr = "UPDATE pokemons SET dex_id = ?, hp = ?, types = ?, stage = ?, description = ?, level = ? WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setInt(1, pokemon.getDexId());
                pstmt.setInt(2, pokemon.getHp());
                pstmt.setString(3, pokemon.getTypes());
                pstmt.setString(4, pokemon.getStage());
                pstmt.setString(5, pokemon.getDescription());
                pstmt.setInt(6, pokemon.getLevel());
                pstmt.setString(7, pokemon.getId());

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Failed to update pokemon, no rows affected.");
                }

                return pokemon;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String queryStr = "DELETE FROM pokemons WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, id);

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Failed to delete pokemon, no rows affected.");
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private Pokemon buildPokemonFromResultSet(ResultSet result) throws SQLException {
        String id = result.getString("card_id");
        int dexId = result.getInt("dex_id");
        int hp = result.getInt("hp");
        String types = result.getString("types");
        String stage = result.getString("stage");
        String description = result.getString("description");
        int level = result.getInt("level");

        return new Pokemon(id, dexId, hp, types, stage, description, level);
    }
}
