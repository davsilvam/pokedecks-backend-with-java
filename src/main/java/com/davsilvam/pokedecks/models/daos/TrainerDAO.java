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
        String query = "INSERT INTO trainers (card_id, effect, type) VALUES (?, ?, ?)";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, trainer.getId());
                pstmt.setString(2, trainer.getEffect());
                pstmt.setString(3, trainer.getType());

                int affected = pstmt.executeUpdate();

                if (affected > 0) {
                    return trainer;
                }

                throw new SQLException("Failed to save trainer.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public Trainer findById(String id) throws SQLException {
        String query = "SELECT * FROM trainers WHERE card_id = ?";
        Trainer trainer = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, id);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        trainer = buildTrainerFromResultSet(rs);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return trainer;
    }

    public Trainer findByCardId(String cardId) throws SQLException {
        String query = "SELECT t.* FROM trainers t JOIN cards c ON t.card_id = c.id WHERE c.id = ?";
        Trainer trainer = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, cardId);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        trainer = buildTrainerFromResultSet(rs);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return trainer;
    }

    @Override
    public List<Trainer> findAll() throws SQLException {
        String query = "SELECT * FROM trainers";
        List<Trainer> list = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    Trainer trainer = buildTrainerFromResultSet(rs);
                    list.add(trainer);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return list;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String query = "SELECT 1 FROM trainers WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, id);

                try (ResultSet rs = pstmt.executeQuery()) {
                    return rs.next();
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
        String query = "SELECT COUNT(*) FROM trainers";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                if (rs.next()) {
                    return rs.getInt(1);
                }

                return 0;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    public Trainer update(Trainer trainer) throws SQLException {
        String query = "UPDATE trainers SET effect = ?, type = ? WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, trainer.getEffect());
                pstmt.setString(2, trainer.getType());
                pstmt.setString(3, trainer.getId());

                int affected = pstmt.executeUpdate();

                if (affected == 0) {
                    throw new SQLException("Failed to update trainer, no rows affected.");
                }

                return trainer;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String query = "DELETE FROM trainers WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, id);

                int affected = pstmt.executeUpdate();

                if (affected == 0) {
                    throw new SQLException("Failed to delete trainer, no rows affected.");
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private Trainer buildTrainerFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("card_id");
        String effect = rs.getString("effect");
        String type = rs.getString("type");

        return new Trainer(id, effect, type);
    }
}
