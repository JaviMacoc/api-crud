package com.bavseal.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="articulos")
@ToString @EqualsAndHashCode
public class Articulo implements Serializable{
    
    @Id    
    @Getter @Setter
    private int id;
    @Getter @Setter
    private String nombre;    
    @Getter @Setter
    private int envase;
    @Getter @Setter
    private int stock;
    @Getter @Setter
    @Enumerated(EnumType.ORDINAL)    
    private TipoDeArticulo tipoDeArticulo;
    @Getter @Setter
    private float costo;
    @Getter @Setter
    private int margen;
    @Getter @Setter
    private float precio;
    
    public void setPrecioAPartirDelMargen(int margen){
        this.setPrecio(this.getCosto()*margen/100 + this.getCosto());
        this.setMargen(margen);
    }
    
    public void setMargenAPartirDelPrecio(float precio) {
        this.setMargen((int)Math.round((precio-this.getCosto())*100 / this.getCosto()));
        this.setPrecio(precio);
    }    
}