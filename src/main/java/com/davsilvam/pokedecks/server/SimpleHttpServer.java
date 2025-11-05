package com.davsilvam.pokedecks.server;

import com.davsilvam.pokedecks.config.auth.AuthFilter;
import com.davsilvam.pokedecks.util.Logger;
import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.net.InetSocketAddress;

public class SimpleHttpServer {
    private final HttpServer server;

    public SimpleHttpServer(int port) throws IOException {
        this.server = HttpServer.create(new InetSocketAddress(port), 0);
    }

    public void register(String path, SimpleServlet servlet) {
        ServletAdapter adapter = new ServletAdapter(servlet);
        AuthFilter authFilter = new AuthFilter(adapter);
        server.createContext(path, authFilter);
        Logger.debug("Rota registrada: %s", path);
    }

    public void start() {
        server.setExecutor(null);
        Logger.info("Servidor HTTP iniciado em http://localhost:%d", server.getAddress().getPort());
        server.start();
    }
}
