package com.bavseal.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="clientes")
@ToString @EqualsAndHashCode
public class Cliente implements Serializable {

    @Id    
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Getter @Setter
    private int id;
    @Getter @Setter
    private String nombre;
    @Getter @Setter
    private String apellido;
    @Getter @Setter
    private String email;
    @Getter @Setter
    private String direccion;
    @Getter @Setter
    private String telefono;
    @OneToMany(mappedBy = "cliente", cascade = {CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE})       
    @Getter @Setter
    private List<Pedido> pedidos;
    
    public Cliente(){
        this.pedidos = new ArrayList<>();
    }
}
