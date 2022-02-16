package com.bavseal.exceptions;

public class RecursoNoEncontradoException extends Exception {
    private static final long serialVersionUID = 1L;
    public RecursoNoEncontradoException(Object resourId) {    
        super(resourId != null ? resourId.toString() : null);
    }    
}
