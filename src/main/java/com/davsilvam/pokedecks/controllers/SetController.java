package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.CardService;
import com.davsilvam.pokedecks.services.SetService;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;
import com.davsilvam.pokedecks.services.dtos.SetWithCardsResponseDTO;

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

        // GET /api/sets
        if (path.equals("/api/sets")) {
            List<SetResponseDTO> sets = setService.getAllSets();
            res.json(sets);
            return;
        }

        // GET /api/sets/{id}
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

        // GET /api/sets/{id}/cards
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
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        // DELETE /api/sets/{id}
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
