package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.AuthenticationService;
import com.davsilvam.pokedecks.services.dtos.AuthenticateResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CreateUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.LoginUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;
import java.util.Base64;

public class AuthController extends SimpleServlet {
    private final AuthenticationService authenticationService;

    public AuthController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @Override
    public void doPost(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.equals("/api/auth/register")) {
            CreateUserRequestDTO dto = JsonUtil.fromJson(req.body(), CreateUserRequestDTO.class);

            if (dto.username() == null || dto.username().isBlank()) {
                res.error(400, "Username é obrigatório");
                return;
            }

            if (dto.email() == null || dto.email().isBlank()) {
                res.error(400, "Email é obrigatório");
                return;
            }

            if (dto.password() == null || dto.password().length() < 6) {
                res.error(400, "Senha deve ter no mínimo 6 caracteres");
                return;
            }

            UserResponseDTO user = authenticationService.register(dto);
            res.json(201, java.util.Map.of("user", user));
            return;
        }

        if (path.equals("/api/auth/authenticate") || path.equals("/api/auth/login")) {
            // Extrair credenciais do header Authorization: Basic
            String authHeader = req.header("Authorization");
            
            if (authHeader == null || !authHeader.startsWith("Basic ")) {
                res.error(401, "Authorization header com Basic Auth é obrigatório");
                return;
            }
            
            try {
                // Decodificar Base64: "Basic base64(email:password)"
                String base64Credentials = authHeader.substring(6);
                byte[] decodedBytes = Base64.getDecoder().decode(base64Credentials);
                String credentials = new String(decodedBytes);
                
                // Separar email:password
                String[] parts = credentials.split(":", 2);
                if (parts.length != 2) {
                    res.error(400, "Formato de credenciais inválido");
                    return;
                }
                
                String email = parts[0];
                String password = parts[1];
                
                // Criar DTO e autenticar
                LoginUserRequestDTO dto = new LoginUserRequestDTO(email, password);
                AuthenticateResponseDTO authResponse = authenticationService.authenticate(dto);
                res.json(authResponse);
                return;
                
            } catch (IllegalArgumentException e) {
                res.error(400, "Credenciais em formato inválido");
                return;
            }
        }

        res.error(404, "Endpoint não encontrado");
    }
}
