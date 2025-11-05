package com.davsilvam.pokedecks;

import com.davsilvam.pokedecks.config.AppCompositionRoot;
import com.davsilvam.pokedecks.server.SimpleHttpServer;
import com.davsilvam.pokedecks.util.Logger;

public class PokeDecksApplication {
    public static void main(String[] args) throws Exception {
        Logger.banner();
        
        Logger.info("Iniciando aplicação PokéDecks...");
        AppCompositionRoot app = AppCompositionRoot.start();

        SimpleHttpServer server = new SimpleHttpServer(8080);
        server.register("/health", app.healthController);
        server.register("/api/users", app.userController);
        server.register("/api/orders", app.orderController);
        server.register("/api/sets", app.setController);
        server.register("/api/cards", app.cardController);
        server.register("/api/series", app.serieController);

        server.start();
        Logger.info("Aplicação iniciada com sucesso! ✅");
        Logger.info("Health check disponível em: http://localhost:8080/health");
    }
}
