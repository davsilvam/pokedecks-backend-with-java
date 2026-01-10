package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.OrderService;
import com.davsilvam.pokedecks.services.dtos.CreateOrderRequestDTO;
import com.davsilvam.pokedecks.services.dtos.OrderResponseDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class OrderController extends SimpleServlet {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.equals("/api/orders")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            List<OrderResponseDTO> orders = orderService.getAllOrders();
            res.json(orders);
            return;
        }

        if (path.matches("^/api/orders/[a-fA-F0-9\\-]+$")) {
            UUID id = UUID.fromString(path.substring(path.lastIndexOf("/") + 1));
            OrderResponseDTO order = orderService.getOrderById(id);

            if (order == null) {
                res.error(404, "Order not found");
                return;
            }

            res.json(order);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPost(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.equals("/api/orders")) {
            String email = req.authenticatedEmail();
            if (email == null) {
                res.error(401, "Unauthorized");
                return;
            }

            CreateOrderRequestDTO dto = JsonUtil.fromJson(req.body(), CreateOrderRequestDTO.class);
            OrderResponseDTO order = orderService.createOrder(dto);
            res.json(201, order);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.matches("^/api/orders/[a-fA-F0-9\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            UUID id = UUID.fromString(path.substring(path.lastIndexOf("/") + 1));
            orderService.deleteOrderById(id);
            res.json(204, Map.of("message", "Order deleted successfully"));
            return;
        }

        res.error(404, "Endpoint not found");
    }
}
