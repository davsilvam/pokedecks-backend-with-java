package com.davsilvam.pokedecks.config.database;

import com.davsilvam.pokedecks.util.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
    private final String url;
    private final String user;
    private final String password;

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

        this.url = props.getProperty("db.url", System.getenv("DB_URL"));
        this.user = props.getProperty("db.user", System.getenv("DB_USER"));
        this.password = props.getProperty("db.password", System.getenv("DB_PASSWORD"));

        if (url == null || user == null || password == null) {
            throw new RuntimeException("Configuração de banco de dados incompleta.");
        }

        Logger.info("Configuração do banco carregada: %s", url);
    }

    public Connection getConn() throws SQLException {
        Logger.debug("Abrindo conexão com o banco de dados...");
        Connection conn = DriverManager.getConnection(url, user, password);
        Logger.debug("Conexão estabelecida com sucesso");
        return conn;
    }
}
