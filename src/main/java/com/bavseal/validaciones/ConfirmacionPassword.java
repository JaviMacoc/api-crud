package com.bavseal.validaciones;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidadorConfirmacionPassword.class)
public @interface ConfirmacionPassword {
    String message() default "<i class=\"fa-solid fa-circle-exclamation\"></i> No coincide la contraseña";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};    
}
