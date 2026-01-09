package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.OrderService;
import com.davsilvam.pokedecks.services.UserService;
import com.davsilvam.pokedecks.services.dtos.EditUserProfileRequestDTO;
import com.davsilvam.pokedecks.services.dtos.OrderResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

public class UserController extends SimpleServlet {
    private final UserService userService;
    private final OrderService orderService;

    public UserController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.equals("/api/users/me")) {
            String email = req.authenticatedEmail();
            if (email == null) {
                res.error(401, "Unauthorized");
                return;
            }

            UserResponseDTO user = userService.findByEmail(email);
            if (user == null) {
                res.error(404, "User not found");
                return;
            }

            res.json(user);
            return;
        }

        if (path.matches("^/api/users/[a-fA-F0-9\\-]+$")) {
            UUID id = UUID.fromString(path.substring(path.lastIndexOf("/") + 1));
            UserResponseDTO user = userService.findById(id);

            if (user == null) {
                res.error(404, "User not found");
                return;
            }

            res.json(user);
            return;
        }

        if (path.equals("/api/users")) {
            // ADMIN-only endpoint
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            List<UserResponseDTO> users = userService.findAll();
            res.json(users);
            return;
        }

        if (path.matches("^/api/users/[a-fA-F0-9\\-]+/orders$")) {
            String[] parts = path.split("/");
            UUID userId = UUID.fromString(parts[3]);
            List<OrderResponseDTO> orders = orderService.getOrdersByUserId(userId);
            res.json(orders);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPut(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.matches("^/api/users/[a-fA-F0-9\\-]+$")) {
            String email = req.authenticatedEmail();

            if (email == null) {
                res.error(401, "Unauthorized");
                return;
            }

            UUID id = UUID.fromString(path.substring(path.lastIndexOf("/") + 1));
            UserResponseDTO currentUser = userService.findByEmail(email);

            if (currentUser == null) {
                res.error(404, "Current user not found");
                return;
            }

            if (!currentUser.id().equals(id)) {
                res.error(403, "Forbidden");
                return;
            }

            EditUserProfileRequestDTO dto = JsonUtil.fromJson(req.body(), EditUserProfileRequestDTO.class);
            UserResponseDTO updated = userService.editProfile(id, dto);
            res.json(updated);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.matches("^/api/users/[a-fA-F0-9\\-]+$")) {
            String email = req.authenticatedEmail();

            if (email == null) {
                res.error(401, "Unauthorized");
                return;
            }

            UUID id = UUID.fromString(path.substring(path.lastIndexOf("/") + 1));
            UserResponseDTO currentUser = userService.findByEmail(email);

            if (currentUser == null) {
                res.error(404, "Current user not found");
                return;
            }

            if (!currentUser.id().equals(id)) {
                res.error(403, "Forbidden");
                return;
            }

            userService.deleteAccount(id);
            res.json(204, java.util.Map.of("message", "User deleted successfully"));
            return;
        }

        res.error(404, "Endpoint not found");
    }
}
