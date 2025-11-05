package com.davsilvam.pokedecks.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public final class PropertiesConfig {
    private final Properties props = new Properties();

    private PropertiesConfig(String resourceName) {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream(resourceName)) {
            if (input == null) {
                throw new RuntimeException("Arquivo de configuração não encontrado: " + resourceName);
            }
            props.load(input);
        } catch (IOException e) {
            throw new RuntimeException("Erro ao carregar configurações: " + e.getMessage(), e);
        }
    }

    public static PropertiesConfig load() {
        return new PropertiesConfig("application.properties");
    }

    public String get(String key) {
        String value = props.getProperty(key);
        if (value == null) {
            throw new RuntimeException("Propriedade não encontrada: " + key);
        }
        return value.trim();
    }

    public String getOrDefault(String key, String defaultValue) {
        return props.getProperty(key, defaultValue).trim();
    }
}
