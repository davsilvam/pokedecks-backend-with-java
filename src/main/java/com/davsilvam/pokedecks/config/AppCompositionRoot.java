package com.davsilvam.pokedecks.config;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.config.database.DatabaseMigrations;
import com.davsilvam.pokedecks.controllers.*;
import com.davsilvam.pokedecks.models.daos.*;
import com.davsilvam.pokedecks.services.*;
import com.davsilvam.pokedecks.util.Logger;

public final class AppCompositionRoot {
    // DAOs
    public final UserDAO userDAO;
    public final CardDAO cardDAO;
    public final SetDAO setDAO;
    public final SerieDAO serieDAO;
    public final PokemonDAO pokemonDAO;
    public final EnergyDAO energyDAO;
    public final TrainerDAO trainerDAO;
    public final OrderDAO orderDAO;

    // Services
    public final AuthenticationService authenticationService;
    public final UserService userService;
    public final CardService cardService;
    public final SetService setService;
    public final SerieService serieService;
    public final OrderService orderService;

    // Controllers
    public final AuthController authController;
    public final UserController userController;
    public final CardController cardController;
    public final SetController setController;
    public final SerieController serieController;
    public final OrderController orderController;
    public final HealthController healthController;


    public AppCompositionRoot() {
        Logger.info("Inicializando Composition Root...");

        DatabaseConnection db = new DatabaseConnection();
        DatabaseMigrations.run(db);

        Logger.debug("Instanciando DAOs...");
        this.userDAO = new UserDAO(db);

        this.cardDAO = new CardDAO(db);
        this.setDAO = new SetDAO(db);
        this.serieDAO = new SerieDAO(db);
        this.pokemonDAO = new PokemonDAO(db);
        this.energyDAO = new EnergyDAO(db);
        this.trainerDAO = new TrainerDAO(db);
        this.orderDAO = new OrderDAO(db);

        Logger.debug("Instanciando Services...");
        this.userService = new UserService(userDAO);
        this.cardService = new CardService(setDAO, cardDAO, pokemonDAO, energyDAO, trainerDAO);
        this.setService = new SetService(serieDAO, setDAO);
        this.serieService = new SerieService(serieDAO);
        this.orderService = new OrderService(orderDAO, userDAO, cardDAO);
        this.authenticationService = new AuthenticationService(userDAO);

        Logger.debug("Instanciando Controllers...");
        this.authController = new AuthController(authenticationService);
        this.userController = new UserController(userService, orderService);
        this.cardController = new CardController(cardService);
        this.setController = new SetController(setService, cardService);
        this.serieController = new SerieController(serieService, setService);
        this.orderController = new OrderController(orderService);
        this.healthController = new HealthController();

        Logger.info("Composition Root inicializado com sucesso");
    }

    public static AppCompositionRoot start() {
        return new AppCompositionRoot();
    }
}
