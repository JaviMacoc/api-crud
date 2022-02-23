package com.bavseal.validaciones;

import com.bavseal.dto.UsuarioDTO;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

class ValidadorConfirmacionPassword implements ConstraintValidator<ConfirmacionPassword, Object> {

    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context) {
        UsuarioDTO usuario = (UsuarioDTO) obj;
        return usuario.getPassword().equals(usuario.getPasswordConfirmado());
    }

}
