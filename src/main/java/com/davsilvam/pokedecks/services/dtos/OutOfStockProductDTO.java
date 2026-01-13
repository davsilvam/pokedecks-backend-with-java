package com.davsilvam.pokedecks.services.dtos;

public record OutOfStockProductDTO(
        String id,
        String name,
        Double price
) {
}
