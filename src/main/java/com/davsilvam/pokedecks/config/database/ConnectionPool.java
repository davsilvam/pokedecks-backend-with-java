package com.davsilvam.pokedecks.config.database;

import com.davsilvam.pokedecks.util.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConnectionPool {
    private final String url;
    private final String user;
    private final String password;
    private final int maxPoolSize;
    private final List<Connection> availableConnections;
    private final List<Connection> usedConnections;

    public ConnectionPool(String url, String user, String password, int initialPoolSize, int maxPoolSize) {
        this.url = url;
        this.user = user;
        this.password = password;
        this.maxPoolSize = maxPoolSize;
        this.availableConnections = new ArrayList<>(initialPoolSize);
        this.usedConnections = new ArrayList<>();

        Logger.info("Inicializando Connection Pool (size=%d, max=%d)...", initialPoolSize, maxPoolSize);

        for (int i = 0; i < initialPoolSize; i++) {
            try {
                availableConnections.add(createConnection());
            } catch (SQLException e) {
                Logger.error("Erro ao criar conexão inicial: %s", e.getMessage());
                throw new RuntimeException("Falha ao inicializar Connection Pool", e);
            }
        }

        Logger.info("Connection Pool inicializado com sucesso ✅");
    }

    private Connection createConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(url, user, password);
        Logger.debug("Nova conexão criada");
        return conn;
    }

    public synchronized Connection getConnection() throws SQLException {
        if (availableConnections.isEmpty()) {
            if (usedConnections.size() < maxPoolSize) {
                Logger.debug("Pool vazio, criando nova conexão (total usado: %d/%d)",
                        usedConnections.size() + 1, maxPoolSize);
                availableConnections.add(createConnection());
            } else {
                throw new SQLException("Connection Pool esgotado! Máximo de " + maxPoolSize + " conexões atingido.");
            }
        }

        Connection connection = availableConnections.removeLast();

        if (connection.isClosed()) {
            Logger.warn("Conexão fechada detectada, recriando...");
            connection = createConnection();
        }

        usedConnections.add(connection);
        Logger.debug("Conexão obtida do pool (disponíveis: %d, usadas: %d)",
                availableConnections.size(), usedConnections.size());

        return connection;
    }

    public synchronized void releaseConnection(Connection connection) {
        if (connection == null) {
            return;
        }

        usedConnections.remove(connection);
        availableConnections.add(connection);

        Logger.debug("Conexão retornada ao pool (disponíveis: %d, usadas: %d)",
                availableConnections.size(), usedConnections.size());
    }

    public synchronized void shutdown() {
        Logger.info("Encerrando Connection Pool...");

        usedConnections.forEach(this::closeConnection);
        availableConnections.forEach(this::closeConnection);

        usedConnections.clear();
        availableConnections.clear();

        Logger.info("Connection Pool encerrado");
    }

    private void closeConnection(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            Logger.error("Erro ao fechar conexão: %s", e.getMessage());
        }
    }

    public synchronized int getAvailableConnectionsCount() {
        return availableConnections.size();
    }

    public synchronized int getUsedConnectionsCount() {
        return usedConnections.size();
    }

    public int getTotalConnectionsCount() {
        return availableConnections.size() + usedConnections.size();
    }
}
