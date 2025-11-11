package com.davsilvam.pokedecks.config.database;

import com.davsilvam.pokedecks.util.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
    private final ConnectionPool connectionPool;

    public DatabaseConnection() {
        Properties props = new Properties();

        try (InputStream in = getClass().getClassLoader().getResourceAsStream("application.properties")) {
            if (in == null) {
                throw new RuntimeException("Arquivo application.properties não encontrado.");
            }

            props.load(in);
        } catch (IOException e) {
            throw new RuntimeException("Erro ao carregar configuração do banco: " + e.getMessage(), e);
        }

        String url = props.getProperty("db.url", System.getenv("DB_URL"));
        String user = props.getProperty("db.user", System.getenv("DB_USER"));
        String password = props.getProperty("db.password", System.getenv("DB_PASSWORD"));

        if (url == null || user == null || password == null) {
            throw new RuntimeException("Configuração de banco de dados incompleta.");
        }

        Logger.info("Configuração do banco carregada: %s", url);

        int initialPoolSize = Integer.parseInt(props.getProperty("db.pool.initial", "5"));
        int maxPoolSize = Integer.parseInt(props.getProperty("db.pool.max", "20"));

        this.connectionPool = new ConnectionPool(url, user, password, initialPoolSize, maxPoolSize);
    }

    public Connection getConn() throws SQLException {
        return connectionPool.getConnection();
    }

    public void releaseConn(Connection conn) {
        connectionPool.releaseConnection(conn);
    }

    public void shutdown() {
        connectionPool.shutdown();
    }

    public ConnectionPool getPool() {
        return connectionPool;
    }
}
