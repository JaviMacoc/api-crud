package com.bavseal.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="usuarios")
@ToString @EqualsAndHashCode
public class Usuario implements Serializable {
    @Id    
    @Getter @Setter
    private int id;
    @Getter @Setter
    private String username;
    @Getter @Setter
    private String nombre;       
    @Getter @Setter
    private String apellido;
    @Getter @Setter
    private String email;       
    @Getter @Setter
    private String password;   
    @Getter @Setter
    @Enumerated(EnumType.STRING)
    private Rol rol;
}

