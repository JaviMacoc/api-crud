package com.bavseal.model;

import lombok.Getter;

public enum TipoDeArticulo {
    FRUTOS_SECOS("Frutos Secos", 0),
    FRUTAS_DESECADAS("Frutas Desecadas", 1),
    SEMILLAS("Semillas", 2);

    @Getter
    private final String nombre;
    @Getter
    private final int orden;

    private TipoDeArticulo(String nombre, int orden) {
        this.nombre = nombre;
        this.orden = orden;
    }
}
