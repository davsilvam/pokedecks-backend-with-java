package com.davsilvam.pokedecks.models;

import com.davsilvam.pokedecks.models.enums.CardCategory;

public class Card {
    private String id;
    private Integer localId;
    private String name;
    private String imageUrl;
    private String illustrator;
    private String rarity;
    private Double price;
    private Integer stockQuantity;
    private CardCategory category;

    // --- N:1 Relationships ---
    private final String setId;

    public Card(
            String id,
            Integer localId,
            String name,
            String imageUrl,
            String illustrator,
            String rarity,
            Double price,
            Integer stockQuantity,
            CardCategory category,
            String setId) {
        this.id = id;
        this.localId = localId;
        this.name = name;
        this.imageUrl = imageUrl;
        this.illustrator = illustrator;
        this.rarity = rarity;
        this.price = price;
        this.stockQuantity = stockQuantity != null ? stockQuantity : 0;
        this.category = category;
        this.setId = setId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getLocalId() {
        return localId;
    }

    public void setLocalId(Integer localId) {
        this.localId = localId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getIllustrator() {
        return illustrator;
    }

    public void setIllustrator(String illustrator) {
        this.illustrator = illustrator;
    }

    public String getRarity() {
        return rarity;
    }

    public void setRarity(String rarity) {
        this.rarity = rarity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public CardCategory getCategory() {
        return category;
    }

    public void setCategory(CardCategory category) {
        this.category = category;
    }

    public String getSetId() {
        return setId;
    }
}