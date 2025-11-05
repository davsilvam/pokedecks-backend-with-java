package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Trainer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainerDAO implements DAO<Trainer, String> {
    private final DatabaseConnection db;

    public TrainerDAO(DatabaseConnection db) {
        this.db = db;
    }

    @Override
    public Trainer save(Trainer trainer) throws SQLException {
        String query = "INSERT INTO trainers (id, effect, type) VALUES (?, ?, ?)";

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, trainer.getId());
            pstmt.setString(2, trainer.getEffect());
            pstmt.setString(3, trainer.getType());

            int affected = pstmt.executeUpdate();

            if (affected > 0) {
                return trainer;
            }

            throw new SQLException("Failed to save trainer.");
        }
    }

    @Override
    public Trainer findById(String id) throws SQLException {
        String query = "SELECT * FROM trainers WHERE id = ?";
        Trainer trainer = null;

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    trainer = buildTrainerFromResultSet(rs);
                }
            }
        }

        return trainer;
    }

    public Trainer findByCardId(String cardId) throws SQLException {
        String query = "SELECT t.* FROM trainers t JOIN cards c ON t.id = c.trainer_id WHERE c.id = ?";
        Trainer trainer = null;

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, cardId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    trainer = buildTrainerFromResultSet(rs);
                }
            }
        }

        return trainer;
    }

    @Override
    public List<Trainer> findAll() throws SQLException {
        String query = "SELECT * FROM trainers";
        List<Trainer> list = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)
        ) {
            while (rs.next()) {
                Trainer trainer = buildTrainerFromResultSet(rs);
                list.add(trainer);
            }
        }

        return list;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String query = "SELECT 1 FROM trainers WHERE id = ?";

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
        String query = "SELECT COUNT(*) FROM trainers";

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
        String query = "DELETE FROM trainers WHERE id = ?";

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(query)
        ) {
            pstmt.setString(1, id);

            int affected = pstmt.executeUpdate();

            if (affected == 0) {
                throw new SQLException("Failed to delete trainer, no rows affected.");
            }
        }
    }

    private Trainer buildTrainerFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String effect = rs.getString("effect");
        String type = rs.getString("type");

        return new Trainer(id, effect, type);
    }
}
