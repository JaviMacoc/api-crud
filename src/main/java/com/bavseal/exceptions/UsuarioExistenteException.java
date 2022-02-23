package com.bavseal.exceptions;

public class UsuarioExistenteException extends Exception{    
    public UsuarioExistenteException(String email){
        super("Un usuario con este mail ya está registrado en la base de datos: " + email);
    }
}
