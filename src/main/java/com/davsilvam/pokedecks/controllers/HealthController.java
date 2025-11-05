package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.util.Logger;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

public class HealthController extends SimpleServlet {
    private static final LocalDateTime START_TIME = LocalDateTime.now();
    private static final String VERSION = "1.0.0";
    private static final String APP_NAME = "PokéDecks API";

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        // GET /health
        switch (path) {
            case "/health" -> {
                Map<String, Object> health = new HashMap<>();
                health.put("status", "UP");
                health.put("application", APP_NAME);
                health.put("version", VERSION);
                health.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
                health.put("uptime", getUptime());

                Logger.debug("Health check realizado");
                res.json(health);
                return;
            }


            // GET /health/ready
            case "/health/ready" -> {
                Map<String, Object> readiness = new HashMap<>();
                readiness.put("status", "READY");
                readiness.put("checks", Map.of(
                        "server", "OK",
                        "routes", "OK"
                ));
                res.json(readiness);
                return;
            }


            // GET /health/live
            case "/health/live" -> {
                Map<String, Object> liveness = new HashMap<>();
                liveness.put("status", "ALIVE");
                liveness.put("uptime", getUptime());
                res.json(liveness);
                return;
            }
        }

        res.error(404, "Endpoint not found");
    }

    private String getUptime() {
        LocalDateTime now = LocalDateTime.now();
        long seconds = java.time.Duration.between(START_TIME, now).getSeconds();

        long days = seconds / 86400;
        long hours = (seconds % 86400) / 3600;
        long minutes = (seconds % 3600) / 60;
        long secs = seconds % 60;

        if (days > 0) {
            return String.format("%dd %dh %dm %ds", days, hours, minutes, secs);
        } else if (hours > 0) {
            return String.format("%dh %dm %ds", hours, minutes, secs);
        } else if (minutes > 0) {
            return String.format("%dm %ds", minutes, secs);
        } else {
            return String.format("%ds", secs);
        }
    }
}
