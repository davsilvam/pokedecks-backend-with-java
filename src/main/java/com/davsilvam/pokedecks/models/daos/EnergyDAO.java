package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Energy;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnergyDAO implements DAO<Energy, String> {
    private final DatabaseConnection db;

    public EnergyDAO(DatabaseConnection db) {
        this.db = db;
    }


    @Override
    public Energy save(Energy energy) throws SQLException {
        String queryStr = "INSERT INTO energies (card_id, effect, type) VALUES (?, ?, ?)";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, energy.getId());
                pstmt.setString(2, energy.getEffect());
                pstmt.setString(3, energy.getType());

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) return energy;
                throw new SQLException("Failed to save the energy card.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public Energy findById(String id) throws SQLException {
        String queryStr = "SELECT * FROM energies WHERE card_id = ?";
        Energy energy = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        energy = buildEnergyFromResultSet(result);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return energy;
    }

    public Energy findByCardId(String cardId) throws SQLException {
        String queryStr = "SELECT e.* FROM energies e JOIN cards c ON e.card_id = c.id WHERE c.id = ?";
        Energy energy = null;

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, cardId);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        energy = buildEnergyFromResultSet(result);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return energy;
    }

    @Override
    public List<Energy> findAll() throws SQLException {
        String queryStr = "SELECT * FROM energies";
        List<Energy> energies = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(queryStr)) {
                while (result.next()) {
                    Energy energy = buildEnergyFromResultSet(result);
                    energies.add(energy);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return energies;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String queryStr = "SELECT 1 FROM energies WHERE card_id = ?";

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
        String queryStr = "SELECT COUNT(*) FROM energies";

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

    public Energy update(Energy energy) throws SQLException {
        String queryStr = "UPDATE energies SET effect = ?, type = ? WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, energy.getEffect());
                pstmt.setString(2, energy.getType());
                pstmt.setString(3, energy.getId());

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Failed to update energy, no rows affected.");
                }

                return energy;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String queryStr = "DELETE FROM energies WHERE card_id = ?";

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setString(1, id);

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Failed to delete energy, no rows affected.");
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private Energy buildEnergyFromResultSet(ResultSet result) throws SQLException {
        String energyId = result.getString("card_id");
        String effect = result.getString("effect");
        String type = result.getString("type");

        return new Energy(energyId, effect, type);
    }
}
