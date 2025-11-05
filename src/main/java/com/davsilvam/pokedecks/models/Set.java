package com.davsilvam.pokedecks.models;

import java.time.LocalDateTime;
import java.util.List;

public class Set {
    private String id;
    private String name;
    private String logoUrl;
    private LocalDateTime releaseDate;

    // --- N:1 Relationships ---
    private final String serieId;

    // --- Eager Loading ---
    private List<Card> cards;
    private int totalCards;

    public Set(String id, String name, String logoUrl, LocalDateTime releaseDate, String serieId) {
        this.id = id;
        this.name = name;
        this.logoUrl = logoUrl;
        this.releaseDate = releaseDate;
        this.serieId = serieId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public LocalDateTime getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDateTime releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getSerieId() {
        return serieId;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }

    public int getCardCount() {
        return totalCards;
    }

    public void setCardCount(int totalCards) {
        this.totalCards = totalCards;
    }
}