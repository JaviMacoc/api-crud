package com.bavseal.model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="articulo")
    @Getter @Setter
    private Articulo articulo;
    @ManyToOne(fetch =  FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="pedido_id")
    @Getter @Setter
    private Pedido pedido;
    @Getter @Setter
    private int cantidad;
    @Getter @Setter
    private long precioUnitario;
    @Getter @Setter
    private long totalLinea;
    
}
