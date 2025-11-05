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
        String queryStr = "INSERT INTO pokemons (id, dex_id, hp, types, stage, description, level) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
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
    }

    @Override
    public Pokemon findById(String id) throws SQLException {
        String queryStr = "SELECT * FROM pokemons WHERE id = ?";
        Pokemon pokemon = null;

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, id);

            try (ResultSet result = pstmt.executeQuery()) {
                if (result.next()) {
                    pokemon = buildPokemonFromResultSet(result);
                }
            }
        }

        return pokemon;
    }

    public Pokemon findByCardId(String cardId) throws SQLException {
        String queryStr = "SELECT p.* FROM pokemons p JOIN cards c ON p.id = c.pokemon_id WHERE c.id = ?";
        Pokemon pokemon = null;

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, cardId);

            try (ResultSet result = pstmt.executeQuery()) {
                if (result.next()) {
                    pokemon = buildPokemonFromResultSet(result);
                }
            }
        }

        return pokemon;
    }

    @Override
    public List<Pokemon> findAll() throws SQLException {
        String queryStr = "SELECT * FROM pokemons";
        List<Pokemon> pokemons = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(queryStr)
        ) {
            while (result.next()) {
                Pokemon pokemon = buildPokemonFromResultSet(result);
                pokemons.add(pokemon);
            }
        }

        return pokemons;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String queryStr = "SELECT 1 FROM pokemons WHERE id = ?";

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
        String queryStr = "SELECT COUNT(*) FROM pokemons";

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
        String queryStr = "DELETE FROM pokemons WHERE id = ?";

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setString(1, id);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Failed to delete pokemon, no rows affected.");
            }
        }
    }

    private Pokemon buildPokemonFromResultSet(ResultSet result) throws SQLException {
        String id = result.getString("id");
        int dexId = result.getInt("dex_id");
        int hp = result.getInt("hp");
        String types = result.getString("types");
        String stage = result.getString("stage");
        String description = result.getString("description");
        int level = result.getInt("level");

        return new Pokemon(id, dexId, hp, types, stage, description, level);
    }
}
