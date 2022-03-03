package com.bavseal.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="lineasDeItems")
public class LineaDeItems implements Serializable {

    @Id
    @Getter @Setter
    private int id;
    @OneToOne
    @Getter @Setter
    private Articulo articulo;
    @ManyToOne
    @Getter @Setter
    private Pedido pedido;
    @Getter @Setter
    private int cantidad;
    @Getter @Setter
    private long precioUnitario;
    @Getter @Setter
    private long totalLinea;
    
}
