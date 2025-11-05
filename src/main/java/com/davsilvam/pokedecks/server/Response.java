package com.davsilvam.pokedecks.server;

import com.davsilvam.pokedecks.util.JsonUtil;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class Response {
    private final HttpExchange exchange;
    private boolean sent = false;
    private int statusCode = 200;

    public Response(HttpExchange exchange) {
        this.exchange = exchange;
        this.exchange.getResponseHeaders().set("Content-Type", "application/json; charset=UTF-8");
    }

    public void status(int code, String body) throws IOException {
        if (sent) {
            return;
        }

        this.statusCode = code;

        byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
        exchange.sendResponseHeaders(code, bytes.length);

        try (OutputStream os = exchange.getResponseBody()) {
            os.write(bytes);
            os.flush();
        }

        sent = true;
    }

    public void json(Object data) throws IOException {
        String json = JsonUtil.toJson(data);
        status(200, json);
    }

    public void json(int code, Map<String, Object> data) throws IOException {
        String json = JsonUtil.toJson(data);
        status(code, json);
    }

    public void error(int code, String message) throws IOException {
        status(code, JsonUtil.message("error", message));
    }


    public boolean isSent() {
        return sent;
    }

    public int getStatusCode() {
        return statusCode;
    }
}
