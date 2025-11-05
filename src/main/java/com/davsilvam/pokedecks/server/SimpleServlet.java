package com.davsilvam.pokedecks.server;

import java.io.IOException;
import java.sql.SQLException;

public abstract class SimpleServlet {
    public void doGet(Request req, Response res) throws IOException {
        res.error(405, "Method not allowed");
    }

    public void doPost(Request req, Response res) throws IOException {
        res.error(405, "Method not allowed");
    }

    public void doPut(Request req, Response res) throws IOException {
        res.error(405, "Method not allowed");
    }

    public void doDelete(Request req, Response res) throws IOException {
        res.error(405, "Method not allowed");
    }
}
