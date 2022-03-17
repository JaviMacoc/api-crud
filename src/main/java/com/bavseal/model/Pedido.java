package com.bavseal.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name="cliente_id")
    @Getter @Setter
    private Cliente cliente;
    @OneToMany(mappedBy="pedido")    
    @Getter @Setter
    private List<LineaDeItems> lineaDeItems;
    @Getter @Setter
    private long total;
}
