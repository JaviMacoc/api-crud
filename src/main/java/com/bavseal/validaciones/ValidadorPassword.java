package com.bavseal.validaciones;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

class ValidadorPassword implements ConstraintValidator<ValidPassword, String> {

    private Pattern pattern;
    private Matcher matcher;

    //REGEX: minimo 8 caracteres, una mayúscula, una minúscula y un número
    /*private static final String PASSWORD = "^[_A-Za-z0-9-+]+(.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$"; */

    //REGEX: mínimo 2 caracteres
    private static final String PASSWORD = "^[a-zA-z0-9\\-]{2,}$";

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        return (validarPassword(password));
    }

    private boolean validarPassword(String password) {
        pattern = Pattern.compile(PASSWORD);
        matcher = pattern.matcher(password);        
        return matcher.matches();        
    }

}
