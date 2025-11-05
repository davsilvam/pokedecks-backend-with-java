package com.davsilvam.pokedecks.config.errors.exceptions;

public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String message) {
        super("Recurso não encontrado: " + message);
    }
}
