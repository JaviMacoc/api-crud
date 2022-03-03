package com.bavseal.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name ="pedidos")
public class Pedido implements Serializable {

    @Id
    @Getter @Setter
    private int id;
    @Getter @Setter
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fecha;
    @ManyToOne
    @Getter @Setter
    private Cliente cliente;
    @OneToMany
    @Getter @Setter
    private LineaDeItems lineaDeItems;
    @Getter @Setter
    private long total;
}
