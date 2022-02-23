package com.bavseal.validaciones;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.TYPE, ElementType.FIELD, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidadorPassword.class)
public @interface ValidPassword {
    String message() default "<i class=\"fa-solid fa-circle-exclamation\"></i> La contraseña debe tener al menos una mayúscula, una minúscula, un número y 8 caracteres de largo";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
