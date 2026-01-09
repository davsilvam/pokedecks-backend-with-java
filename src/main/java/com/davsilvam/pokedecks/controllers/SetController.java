package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.CardService;
import com.davsilvam.pokedecks.services.SetService;
import com.davsilvam.pokedecks.services.dtos.CreateSetRequestDTO;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;
import com.davsilvam.pokedecks.services.dtos.SetWithCardsResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UpdateSetRequestDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class SetController extends SimpleServlet {
    private final SetService setService;
    private final CardService cardService;

    public SetController(SetService setService, CardService cardService) {
        this.setService = setService;
        this.cardService = cardService;
    }

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        // Require authentication for all GET endpoints
        String email = req.authenticatedEmail();
        if (email == null) {
            res.error(401, "Unauthorized - Authentication required");
            return;
        }

        if (path.equals("/api/sets")) {
            List<SetResponseDTO> sets = setService.getAllSets();
            res.json(sets);
            return;
        }

        if (path.matches("^/api/sets/[\\w\\-]+$")) {
            String id = path.substring(path.lastIndexOf("/") + 1);
            SetResponseDTO set = setService.getSetById(id);

            if (set == null) {
                res.error(404, "Set not found");
                return;
            }

            res.json(set);
            return;
        }

        if (path.matches("^/api/sets/[\\w\\-]+/cards$")) {
            String[] parts = path.split("/");
            String id = parts[3];
            SetWithCardsResponseDTO setWithCards = cardService.getCardsBySetId(id);

            if (setWithCards == null) {
                res.error(404, "Set not found");
                return;
            }

            res.json(setWithCards);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPost(Request req, Response res) throws IOException {
        String path = req.path();

        // POST /api/sets
        if (path.equals("/api/sets")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String body = req.body();
            CreateSetRequestDTO request = JsonUtil.fromJson(body, CreateSetRequestDTO.class);
            SetResponseDTO created = setService.createSet(request);
            res.json(201, created);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPut(Request req, Response res) throws IOException {
        String path = req.path();

        // PUT /api/sets/{id}
        if (path.matches("^/api/sets/[\\w\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String id = path.substring(path.lastIndexOf("/") + 1);
            String body = req.body();
            UpdateSetRequestDTO request = JsonUtil.fromJson(body, UpdateSetRequestDTO.class);
            SetResponseDTO updated = setService.updateSet(id, request);
            res.json(updated);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.matches("^/api/sets/[\\w\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String id = path.substring(path.lastIndexOf("/") + 1);
            setService.deleteSetById(id);
            res.json(204, Map.of("message", "Set deleted successfully"));
            return;
        }

        res.error(404, "Endpoint not found");
    }
}

