package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Serie;
import com.davsilvam.pokedecks.models.Set;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SerieDAO implements DAO<Serie, String> {
    private final DatabaseConnection db;
    private final SetDAO setDAO;

    public SerieDAO(DatabaseConnection db) {
        this.db = db;
        this.setDAO = new SetDAO(db);
    }

    @Override
    public Serie save(Serie serie) throws SQLException {
        String query = "INSERT INTO series (id, name, logo_url) VALUES (?, ?, ?)";
        Logger.sql(query, serie.getId(), serie.getName(), serie.getLogoUrl());

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, serie.getId());
                pstmt.setString(2, serie.getName());
                pstmt.setString(3, serie.getLogoUrl());

                int affected = pstmt.executeUpdate();

                if (affected > 0) {
                    Logger.debug("Série salva: %s", serie.getId());
                    return serie;
                }

                throw new SQLException("Failed to save serie.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public Serie findById(String id) throws SQLException {
        String query = "SELECT s.*, COUNT(st.id) as sets_count " +
                      "FROM series s " +
                      "LEFT JOIN sets st ON s.id = st.serie_id " +
                      "WHERE s.id = ? " +
                      "GROUP BY s.id, s.name, s.logo_url";
        Logger.sql(query, id);

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, id);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        Serie serie = buildSerieFromResultSet(rs);
                        int count = rs.getInt("sets_count");
                        serie.setSetCount(count);
                        return serie;
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return null;
    }

    public Serie findByIdWithSets(String id) throws SQLException {
        Serie serie = findById(id);
        if (serie == null) return null;

        return loadSerieSets(serie);
    }

    @Override
    public List<Serie> findAll() throws SQLException {
        String query = "SELECT s.*, COUNT(st.id) as sets_count " +
                      "FROM series s " +
                      "LEFT JOIN sets st ON s.id = st.serie_id " +
                      "GROUP BY s.id, s.name, s.logo_url";
        Logger.sql(query);
        List<Serie> list = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    Serie serie = buildSerieFromResultSet(rs);
                    int count = rs.getInt("sets_count");
                    serie.setSetCount(count);
                    list.add(serie);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        Logger.debug("Encontradas %d séries", list.size());
        return list;
    }

    public List<Serie> findAllWithSets() throws SQLException {
        List<Serie> series = findAll();
        
        for (Serie serie : series) {
            loadSerieSets(serie);
        }
        
        return series;
    }

    @Override
    public boolean existsById(String id) throws SQLException {
        String query = "SELECT 1 FROM series WHERE id = ?";
        Logger.sql(query, id);

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
        String query = "SELECT COUNT(*) FROM series";
        Logger.sql(query);

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

    public Serie update(Serie serie) throws SQLException {
        String query = "UPDATE series SET name = ?, logo_url = ? WHERE id = ?";
        Logger.sql(query, serie.getName(), serie.getLogoUrl(), serie.getId());

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, serie.getName());
                pstmt.setString(2, serie.getLogoUrl());
                pstmt.setString(3, serie.getId());

                int affected = pstmt.executeUpdate();

                if (affected == 0) {
                    throw new SQLException("Failed to update serie, no rows affected.");
                }

                Logger.debug("Série atualizada: %s", serie.getId());
                return serie;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public void deleteById(String id) throws SQLException {
        String query = "DELETE FROM series WHERE id = ?";
        Logger.sql(query, id);

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, id);

                int affected = pstmt.executeUpdate();

                if (affected == 0) {
                    throw new SQLException("Failed to delete serie, no rows affected.");
                }
                
                Logger.debug("Série deletada: %s", id);
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private Serie loadSerieSets(Serie serie) throws SQLException {
        List<Set> sets = setDAO.findBySerieId(serie.getId());
        serie.setSets(sets);
        
        Logger.debug("Carregados %d sets para a série %s", sets.size(), serie.getId());
        return serie;
    }

    private Serie buildSerieFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String logoUrl = rs.getString("logo_url");

        return new Serie(id, name, logoUrl);
    }
}
