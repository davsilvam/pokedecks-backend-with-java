package com.davsilvam.pokedecks.server;

import com.sun.net.httpserver.HttpExchange;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.stream.Collectors;

public class Request {
    private final HttpExchange exchange;

    public Request(HttpExchange exchange) {
        this.exchange = exchange;
    }

    public String body() {
        try (InputStream is = exchange.getRequestBody()) {
            return new String(is.readAllBytes(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            return "";
        }
    }

    public String path() {
        return exchange.getRequestURI().getPath();
    }

    public String param(String name) {
        String path = exchange.getRequestURI().getPath();
        String[] segments = path.split("/");
        return segments[segments.length - 1];
    }

    public String query(String key) {
        String query = exchange.getRequestURI().getQuery();
        if (query == null) return null;
        for (String pair : query.split("&")) {
            String[] kv = pair.split("=");
            if (kv[0].equals(key)) return kv.length > 1 ? kv[1] : null;
        }
        return null;
    }

    public String header(String name) {
        return exchange.getRequestHeaders().getFirst(name);
    }

    public String authenticatedEmail() {
        Object email = exchange.getAttribute("authenticatedEmail");
        return email != null ? email.toString() : null;
    }

    public String authenticatedRole() {
        Object role = exchange.getAttribute("authenticatedRole");
        return role != null ? role.toString() : null;
    }

    public Map<String, String> headers() {
        return exchange.getRequestHeaders().entrySet()
                .stream()
                .collect(Collectors.toMap(Map.Entry::getKey, e -> e.getValue().get(0)));
    }
}
