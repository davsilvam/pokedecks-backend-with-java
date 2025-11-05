package com.davsilvam.pokedecks.config.auth;

import com.davsilvam.pokedecks.util.Logger;
import com.sun.net.httpserver.*;

import java.io.IOException;

public class AuthFilter implements HttpHandler {
    private final HttpHandler next;

    public AuthFilter(HttpHandler next) {
        this.next = next;
    }

    @Override
    public void handle(HttpExchange exchange) throws IOException {
        String authHeader = exchange.getRequestHeaders().getFirst("Authorization");

        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);

            try {
                String email = JwtUtil.validateAndExtractEmail(token);
                String role = JwtUtil.extractRole(token);

                if (email != null) {
                    exchange.setAttribute("authenticatedEmail", email);
                }
                if (role != null) {
                    exchange.setAttribute("authenticatedRole", role);
                }
                
                Logger.debug("Token JWT validado com sucesso para: %s", email);
            } catch (Exception e) {
                Logger.warn("Token JWT inválido ou expirado: %s", e.getMessage());
                exchange.sendResponseHeaders(401, -1);
                return;
            }
        }

        next.handle(exchange);
    }
}
