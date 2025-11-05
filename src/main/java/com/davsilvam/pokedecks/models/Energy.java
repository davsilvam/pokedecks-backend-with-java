package com.davsilvam.pokedecks.models;

public class Energy {
    private String id; // cardId
    private String effect;
    private String type;

    public Energy(String id, String effect, String type) {
        this.id = id;
        this.effect = effect;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}