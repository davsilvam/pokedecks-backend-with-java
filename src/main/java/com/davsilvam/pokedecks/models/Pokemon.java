package com.davsilvam.pokedecks.models;

public class Pokemon {
    private String id; // cardId
    private int dexId;
    private int hp;
    private String types; // Comma-separated types
    private String stage;
    private String description;
    private int level;

    public Pokemon(String id, int dexId, int hp, String types, String stage, String description, int level) {
        this.id = id;
        this.dexId = dexId;
        this.hp = hp;
        this.types = types;
        this.stage = stage;
        this.description = description;
        this.level = level;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getDexId() {
        return dexId;
    }

    public void setDexId(int dexId) {
        this.dexId = dexId;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}