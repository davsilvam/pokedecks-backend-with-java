package com.davsilvam.pokedecks.models;

import java.util.UUID;

public class OrderItem {
    private UUID id;
    private int quantity = 1;

    // --- N:1 Relationships ---
    private final UUID orderId;
    private final String cardId;

    // --- Eager Loading ---
    private Card card;

    public OrderItem(UUID id, int quantity, UUID orderId, String cardId) {
        this.id = id;
        this.quantity = quantity;
        this.orderId = orderId;
        this.cardId = cardId;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public UUID getOrderId() {
        return orderId;
    }

    public String getCardId() {
        return cardId;
    }

    public Card getCard() {
        return card;
    }

    public void setCard(Card card) {
        this.card = card;
    }
}