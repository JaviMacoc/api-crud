package com.bavseal.exceptions;

public class RecursoNoEncontradoException extends Exception {
    private static final long serialVersionUID = 1L;
    public RecursoNoEncontradoException(Object recurso) {    
        super(recurso != null ? recurso.toString() : "El recurso que esta buscando no existe");
    }    
}
