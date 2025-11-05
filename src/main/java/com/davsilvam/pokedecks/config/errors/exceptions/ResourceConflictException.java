package com.davsilvam.pokedecks.config.errors.exceptions;

public class ResourceConflictException extends RuntimeException {
    public ResourceConflictException(String message) {
        super("Conflito de recurso: " + message);
    }
}
