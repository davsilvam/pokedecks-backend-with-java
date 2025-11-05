package com.davsilvam.pokedecks.models;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class Order {
    private UUID id;
    private LocalDateTime orderTime;

    // --- N:1 Relationships ---
    private final UUID userId;

    // --- Eager Loading ---
    private User user;
    private List<OrderItem> orderItems;

    public Order(UUID id, LocalDateTime orderTime, UUID userId) {
        this.id = id;
        this.orderTime = orderTime;
        this.userId = userId;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public UUID getUserId() {
        return userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}