package com.bavseal.dto;

import com.bavseal.model.Rol;
import com.bavseal.validaciones.ValidEmail;
import com.bavseal.validaciones.ValidPassword;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import com.bavseal.validaciones.ConfirmacionPassword;
import lombok.ToString;

@ConfirmacionPassword
@ToString
public class UsuarioDTO {
    @NotNull
    @NotEmpty(message = "Debe ingresar un nombre.")
    @Getter @Setter
    private String nombre;
    @NotNull    
    @NotEmpty(message = "Debe ingresar un apellido.")    
    @Getter @Setter
    private String apellido;
    @NotNull    
    @ValidEmail
    @Getter @Setter
    private String email;    
    @Getter @Setter
    private String username;    
    //@Getter @Setter
    //private Rol rol;
    @NotNull    
    @ValidPassword
    @Getter @Setter
    private String password;
    @Getter @Setter
    private String passwordConfirmado;
}
