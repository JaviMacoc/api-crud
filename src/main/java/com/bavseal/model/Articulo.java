package com.bavseal.model;

import java.io.Serializable;
import javax.persistence.Entity;
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
    private TipoDeArticulo tipoDeArticulo;
    @Getter @Setter
    private float costo;
    @Getter @Setter
    private int margen;
    @Getter @Setter
    private float precio;
    
    public void setPrecioAPartirDelMargen(String margen){
        this.setPrecio(this.getCosto()*Integer.parseInt(margen)/100 + this.getCosto());
        this.setMargen(Integer.parseInt(margen));
    }
    
    public void setMargenAPartirDelPrecio(String precio) {
        this.setMargen((int)Math.round(Float.parseFloat(precio)/this.getCosto()*100 + this.getCosto()));
        this.setPrecio(Float.parseFloat(precio));
    }
    
}