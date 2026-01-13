package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.models.enums.UserRole;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserDAO implements DAO<User, UUID> {
    private final DatabaseConnection db;

    public UserDAO(DatabaseConnection db) {
        this.db = db;
    }

    @Override
    public User save(User user) throws SQLException {
        String query = "INSERT INTO users (id, name, username, email, password_hash, role, phone_number, birth_date, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Logger.sql(query, user.getId(), user.getName(), user.getUsername(), user.getEmail(), "***", user.getRole(), user.getPhoneNumber(), user.getBirthDate(), user.getAddress());
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setObject(1, user.getId());
                pstmt.setString(2, user.getName());
                pstmt.setString(3, user.getUsername());
                pstmt.setString(4, user.getEmail());
                pstmt.setString(5, user.getPasswordHash());
                pstmt.setString(6, user.getRole() != null ? user.getRole().name() : null);
                pstmt.setString(7, user.getPhoneNumber());

                if (user.getBirthDate() != null) {
                    pstmt.setDate(8, Date.valueOf(user.getBirthDate()));
                } else {
                    pstmt.setNull(8, Types.DATE);
                }

                pstmt.setString(9, user.getAddress());

                int affected = pstmt.executeUpdate();

                if (affected > 0) {
                    Logger.debug("Usuário salvo com sucesso: %s", user.getEmail());
                    return user;
                }

                throw new SQLException("Failed to save user.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public User findById(UUID id) throws SQLException {
        String query = "SELECT * FROM users WHERE id = ?";
        Logger.sql(query, id);
        User user = null;
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setObject(1, id);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        user = buildUserFromResultSet(rs);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return user;
    }

    public User findByUsername(String username) throws SQLException {
        String query = "SELECT * FROM users WHERE username = ?";
        Logger.sql(query, username);
        User user = null;
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, username);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        user = buildUserFromResultSet(rs);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return user;
    }

    public User findByEmail(String email) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ?";
        Logger.sql(query, email);
        User user = null;
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, email);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        user = buildUserFromResultSet(rs);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return user;
    }

    @Override
    public List<User> findAll() throws SQLException {
        String query = "SELECT * FROM users";
        Logger.sql(query);
        List<User> list = new ArrayList<>();
        Connection conn = null;

        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    User user = buildUserFromResultSet(rs);
                    list.add(user);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        Logger.debug("Encontrados %d usuários", list.size());
        return list;
    }

    @Override
    public boolean existsById(UUID id) throws SQLException {
        String query = "SELECT 1 FROM users WHERE id = ?";
        Logger.sql(query, id);
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setObject(1, id);

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
        String query = "SELECT COUNT(*) FROM users";
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

    @Override
    public void deleteById(UUID id) throws SQLException {
        String query = "DELETE FROM users WHERE id = ?";
        Logger.sql(query, id);
        Connection conn = null;

        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setObject(1, id);

                int affected = pstmt.executeUpdate();

                if (affected == 0) {
                    throw new SQLException("Failed to delete user, no rows affected.");
                }

                Logger.debug("Usuário deletado: %s", id);
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private User buildUserFromResultSet(ResultSet rs) throws SQLException {
        UUID id = rs.getObject("id", UUID.class);
        String name = rs.getString("name");
        String username = rs.getString("username");
        String email = rs.getString("email");
        String passwordHash = rs.getString("password_hash");
        String roleStr = rs.getString("role");
        UserRole role = roleStr != null ? UserRole.valueOf(roleStr) : null;
        String phone = rs.getString("phone_number");
        Date bd = rs.getDate("birth_date");
        LocalDate birthDate = bd != null ? bd.toLocalDate() : null;
        String address = rs.getString("address");

        return new User(id, name, username, email, passwordHash, role, phone, birthDate, address);
    }
}
