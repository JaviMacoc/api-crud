package com.bavseal.model;

public enum TipoDeArticulo {
    FRUTOS_SECOS ("Frutos Secos"),
    FRUTAS_DESECADAS ("Frutas Desecadas"),
    SEMILLAS ("Semillas");

    private final String tipoDeProducto;


TipoDeArticulo(String tipoDeProducto){
    this.tipoDeProducto = tipoDeProducto;
}

public String getTipoDeProducto(){
    return tipoDeProducto;
}
}
