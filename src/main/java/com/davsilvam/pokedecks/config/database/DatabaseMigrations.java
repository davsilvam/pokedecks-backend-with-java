package com.davsilvam.pokedecks.config.database;

import com.davsilvam.pokedecks.util.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public final class DatabaseMigrations {
    private static final String VERSION_TABLE = "schema_version";
    private static final List<String> MIGRATIONS = List.of(
            "migrations/V1__create_project_entities.sql",
            "migrations/V2__seed_initial_data.sql"
    );

    private DatabaseMigrations() {
    }

    public static void run(DatabaseConnection db) {
        Connection connection = null;
        try {
            Logger.info("Verificando estado das migrations...");
            connection = db.getConn();
            ensureVersionTable(connection);

            for (String resource : MIGRATIONS) {
                String version = extractVersion(resource);

                if (isMigrationApplied(connection, version)) {
                    Logger.debug("Migration já aplicada: %s", version);
                    continue;
                }

                Logger.info("Aplicando migration: %s", version);
                applyMigration(connection, resource, version);
                Logger.info("Migration aplicada com sucesso: %s", version);
            }

            Logger.info("Migrations verificadas com sucesso ✅");
        } catch (IOException | SQLException e) {
            Logger.error("Erro ao executar migrations: %s", e.getMessage());
            throw new RuntimeException("Falha ao executar migrations", e);
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                } catch (SQLException ignored) {
                }

                try {
                    connection.close();
                } catch (SQLException ignored) {
                }
            }
        }
    }

    private static void applyMigration(Connection connection, String resource, String version) throws IOException, SQLException {
        boolean previousAutoCommit = connection.getAutoCommit();
        connection.setAutoCommit(false);

        try {
            for (String statementSql : loadStatements(resource)) {
                Logger.sql(statementSql);
                try (Statement statement = connection.createStatement()) {
                    statement.execute(statementSql);
                }
            }

            registerMigration(connection, version);
            connection.commit();
        } catch (SQLException | IOException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(previousAutoCommit);
        }
    }

    private static void ensureVersionTable(Connection connection) throws SQLException {
        String ddl = """
                CREATE TABLE IF NOT EXISTS %s (
                    version VARCHAR(150) PRIMARY KEY,
                    applied_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
                )
                """.formatted(VERSION_TABLE);

        try (Statement statement = connection.createStatement()) {
            statement.execute(ddl);
        }
    }

    private static boolean isMigrationApplied(Connection connection, String version) throws SQLException {
        String query = "SELECT 1 FROM %s WHERE version = ?".formatted(VERSION_TABLE);

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, version);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    private static void registerMigration(Connection connection, String version) throws SQLException {
        String insert = "INSERT INTO %s (version, applied_at) VALUES (?, NOW())".formatted(VERSION_TABLE);

        try (PreparedStatement preparedStatement = connection.prepareStatement(insert)) {
            preparedStatement.setString(1, version);
            preparedStatement.executeUpdate();
        }
    }

    private static List<String> loadStatements(String resource) throws IOException {
        try (InputStream inputStream = DatabaseMigrations.class.getClassLoader().getResourceAsStream(resource)) {
            assert inputStream != null;

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
                StringBuilder builder = new StringBuilder();
                String line;

                while ((line = reader.readLine()) != null) {
                    String trimmed = line.trim();

                    if (trimmed.isEmpty() || trimmed.startsWith("--")) {
                        continue;
                    }

                    builder.append(line).append('\n');
                }

                return splitStatements(builder.toString());
            }
        }
    }

    private static List<String> splitStatements(String sql) {
        List<String> statements = new ArrayList<>();
        StringBuilder current = new StringBuilder();

        for (int i = 0; i < sql.length(); i++) {
            char ch = sql.charAt(i);

            if (ch == ';') {
                String statement = current.toString().trim();

                if (!statement.isEmpty()) {
                    statements.add(statement);
                }

                current.setLength(0);
            } else {
                current.append(ch);
            }
        }

        String remaining = current.toString().trim();
        if (!remaining.isEmpty()) {
            statements.add(remaining);
        }

        return statements;
    }

    private static String extractVersion(String resource) {
        int separatorIndex = resource.lastIndexOf('/');
        return separatorIndex >= 0 ? resource.substring(separatorIndex + 1) : resource;
    }
}
