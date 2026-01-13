package com.davsilvam.pokedecks;

import com.davsilvam.pokedecks.config.AppCompositionRoot;
import com.davsilvam.pokedecks.server.SimpleHttpServer;
import com.davsilvam.pokedecks.util.Logger;
import com.davsilvam.pokedecks.util.PropertiesConfig;

public class PokeDecksApplication {
    public static void main(String[] args) throws Exception {
        Logger.banner();
        
        Logger.info("Iniciando aplicação PokéDecks...");
        AppCompositionRoot app = AppCompositionRoot.start();

        // Ler porta das propriedades ou variável de ambiente
        PropertiesConfig config = PropertiesConfig.load();
        int port = Integer.parseInt(
            System.getenv("PORT") != null 
                ? System.getenv("PORT") 
                : config.getOrDefault("server.port", "8081")
        );

        SimpleHttpServer server = new SimpleHttpServer(port);
        server.register("/health", app.healthController);
        server.register("/api/auth", app.authController);
        server.register("/api/users", app.userController);
        server.register("/api/orders", app.orderController);
        server.register("/api/sets", app.setController);
        server.register("/api/cards", app.cardController);
        server.register("/api/series", app.serieController);
        server.register("/reports", app.reportController);

        server.start();
        Logger.info("Aplicação iniciada com sucesso! ✅");
        Logger.info("Health check disponível em: http://localhost:%d/health", port);
    }
}
