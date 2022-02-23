package com.bavseal.dto;

import com.bavseal.validaciones.ValidEmail;
import com.bavseal.validaciones.ValidPassword;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import com.bavseal.validaciones.ConfirmacionPassword;
import javax.validation.constraints.Size;

@ConfirmacionPassword
public class UsuarioDTO {
    @NotNull
    @NotEmpty(message = "<i class=\"fa-solid fa-circle-exclamation\"></i> Debe ingresar un nombre.")
    @Getter @Setter
    private String nombre;
    @NotNull    
    @NotEmpty(message = "Debe ingresar un apellido.")
    @Size(min = 2, message = "<i class=\"fa-solid fa-circle-exclamation\"></i> El apellido debe contener al menos 2 caracteres")
    @Getter @Setter
    private String apellido;
    @NotNull    
    @ValidEmail
    @Getter @Setter
    private String email;
    @Getter @Setter
    private String username;
    @NotNull    
    @ValidPassword
    @Getter @Setter
    private String password;
    @Getter @Setter
    private String passwordConfirmado;
}
