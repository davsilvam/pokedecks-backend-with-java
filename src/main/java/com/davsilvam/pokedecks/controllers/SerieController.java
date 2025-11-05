package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.SerieService;
import com.davsilvam.pokedecks.services.SetService;
import com.davsilvam.pokedecks.services.dtos.SerieResponseDTO;
import com.davsilvam.pokedecks.services.dtos.SetResponseDTO;

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

        // GET /api/series
        if (path.equals("/api/series")) {
            List<SerieResponseDTO> series = serieService.getAllSeries();
            res.json(series);
            return;
        }

        // GET /api/series/{id}
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

        // GET /api/series/{id}/sets
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
    public void doDelete(Request req, Response res) throws IOException {
        String path = req.path();

        // DELETE /api/series/{id}
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
