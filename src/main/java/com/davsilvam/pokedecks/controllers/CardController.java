package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.CardService;
import com.davsilvam.pokedecks.services.dtos.CardBriefResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CardResponseDTO;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class CardController extends SimpleServlet {
    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        // GET /api/cards/search?name=xxx
        if (path.equals("/api/cards/search")) {
            String name = req.query("name");
            if (name == null || name.isEmpty()) {
                res.error(400, "Query parameter 'name' is required");
                return;
            }

            List<CardBriefResponseDTO> cards = cardService.searchCardsByName(name);
            res.json(cards);
            return;
        }

        // GET /api/cards
        if (path.equals("/api/cards")) {
            List<CardBriefResponseDTO> cards = cardService.getAllCards();
            res.json(cards);
            return;
        }

        // GET /api/cards/{id}
        if (path.matches("^/api/cards/[\\w\\-]+$")) {
            String id = path.substring(path.lastIndexOf("/") + 1);
            CardResponseDTO card = cardService.getCardById(id);

            if (card == null) {
                res.error(404, "Card not found");
                return;
            }

            res.json(card);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        // DELETE /api/cards/{id}
        if (path.matches("^/api/cards/[\\w\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String id = path.substring(path.lastIndexOf("/") + 1);
            cardService.deleteCardById(id);
            res.json(204, Map.of("message", "Card deleted successfully"));
            return;
        }

        res.error(404, "Endpoint not found");
    }
}
