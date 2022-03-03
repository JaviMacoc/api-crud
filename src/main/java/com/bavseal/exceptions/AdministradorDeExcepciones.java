package com.bavseal.exceptions;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

@ControllerAdvice
public class AdministradorDeExcepciones {

    @ExceptionHandler(value = {UsuarioExistenteException.class})
    public RedirectView administrarError(UsuarioExistenteException ex, HttpServletRequest request) {
        RedirectView redirectView = new RedirectView("/registroForm");
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
        if (outputFlashMap != null) {
            outputFlashMap.put("mensaje", ex.getMessage());
        }
        return redirectView;
    }

    @ExceptionHandler(value = {RecursoNoEncontradoException.class})
    public RedirectView administrarError(RecursoNoEncontradoException ex, HttpServletRequest request) {
        RedirectView redirectView = new RedirectView("/");
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
        if (outputFlashMap != null) {
            outputFlashMap.put("mensaje", ex.getMessage());
        }
        return redirectView;
    }
    @ExceptionHandler(value = {UsernameNotFoundException.class})
    public RedirectView administrarError(UsernameNotFoundException ex, HttpServletRequest request) {
        RedirectView redirectView = new RedirectView("/loginForm");
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
        if (outputFlashMap != null) {
            outputFlashMap.put("mensaje", ex.getMessage());
        }
        return redirectView;
    }

}
