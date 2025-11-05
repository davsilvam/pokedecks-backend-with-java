package com.davsilvam.pokedecks.server;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.util.Logger;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.io.OutputStream;

public class ServletAdapter implements HttpHandler {
    private final SimpleServlet servlet;

    public ServletAdapter(SimpleServlet servlet) {
        this.servlet = servlet;
    }

    @Override
    public void handle(HttpExchange exchange) throws IOException {
        long startTime = System.currentTimeMillis();
        Request req = new Request(exchange);
        Response res = new Response(exchange);
        
        String method = exchange.getRequestMethod();
        String path = req.path();
        String authenticatedUser = req.authenticatedEmail();

        if (authenticatedUser != null) {
            Logger.debug("Usuário autenticado: %s | Role: %s", authenticatedUser, req.authenticatedRole());
        }

        try {
            switch (method) {
                case "GET" -> servlet.doGet(req, res);
                case "POST" -> servlet.doPost(req, res);
                case "PUT" -> servlet.doPut(req, res);
                case "DELETE" -> servlet.doDelete(req, res);
                default -> res.error(405, "Method not allowed");
            }
        } catch (ResourceNotFoundException e) {
            Logger.warn("Recurso não encontrado: %s", e.getMessage());
            res.error(404, e.getMessage());
        } catch (ResourceConflictException e) {
            Logger.warn("Conflito de recurso: %s", e.getMessage());
            res.error(409, e.getMessage());
        } catch (DatabaseException e) {
            Logger.error("Erro de banco de dados", e);
            res.error(500, "Database error: " + e.getMessage());
        } catch (SecurityException e) {
            Logger.warn("Erro de segurança: %s", e.getMessage());
            res.error(401, e.getMessage());
        } catch (Exception e) {
            Logger.error("Erro interno do servidor", e);
            res.error(500, "Internal Server Error: " + e.getMessage());
        }

        if (!res.isSent()) {
            String response = "No content";
            exchange.sendResponseHeaders(res.getStatusCode(), response.length());
            try (OutputStream os = exchange.getResponseBody()) {
                os.write(response.getBytes());
            }
        }

        exchange.close();
        
        long duration = System.currentTimeMillis() - startTime;
        Logger.http(method, path, res.getStatusCode(), duration);
    }
}
