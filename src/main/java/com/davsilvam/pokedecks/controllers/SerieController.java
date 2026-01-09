package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.SerieService;
import com.davsilvam.pokedecks.services.SetService;
import com.davsilvam.pokedecks.services.dtos.CreateSerieRequestDTO;
import com.davsilvam.pokedecks.services.dtos.SerieResponseDTO;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UpdateSerieRequestDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;
import java.util.List;

public class SerieController extends SimpleServlet {
    private final SerieService serieService;
    private final SetService setService;

    public SerieController(SerieService serieService, SetService setService) {
        this.serieService = serieService;
        this.setService = setService;
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

        if (path.equals("/api/series")) {
            List<SerieResponseDTO> series = serieService.getAllSeries();
            res.json(series);
            return;
        }

        if (path.matches("^/api/series/[\\w\\-]+$")) {
            String id = path.substring(path.lastIndexOf("/") + 1);
            SerieResponseDTO serie = serieService.getSerieById(id);

            if (serie == null) {
                res.error(404, "Serie not found");
                return;
            }

            res.json(serie);
            return;
        }

        if (path.matches("^/api/series/[\\w\\-]+/sets$")) {
            String[] parts = path.split("/");
            String id = parts[3];
            List<SetResponseDTO> sets = setService.getSetsBySerieId(id);

            if (sets == null) {
                res.error(404, "Serie not found");
                return;
            }

            res.json(sets);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPost(Request req, Response res) throws IOException {
        String path = req.path();

        // POST /api/series
        if (path.equals("/api/series")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String body = req.body();
            CreateSerieRequestDTO request = JsonUtil.fromJson(body, CreateSerieRequestDTO.class);
            SerieResponseDTO created = serieService.createSerie(request);
            res.json(201, created);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doPut(Request req, Response res) throws IOException {
        String path = req.path();

        // PUT /api/series/{id}
        if (path.matches("^/api/series/[\\w\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String id = path.substring(path.lastIndexOf("/") + 1);
            String body = req.body();
            UpdateSerieRequestDTO request = JsonUtil.fromJson(body, UpdateSerieRequestDTO.class);
            SerieResponseDTO updated = serieService.updateSerie(id, request);
            res.json(updated);
            return;
        }

        res.error(404, "Endpoint not found");
    }

    @Override
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        if (path.matches("^/api/series/[\\w\\-]+$")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String id = path.substring(path.lastIndexOf("/") + 1);
            serieService.deleteSerieById(id);
            res.json(204, java.util.Map.of("message", "Serie deleted successfully"));
            return;
        }

        res.error(404, "Endpoint not found");
    }
}

