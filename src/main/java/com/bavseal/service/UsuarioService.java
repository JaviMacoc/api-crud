package com.bavseal.service;

import com.bavseal.dto.UsuarioDTO;
import com.bavseal.exceptions.UsuarioExistenteException;
import com.bavseal.model.Usuario;

public interface UsuarioService {
    public Usuario registrarUsuarioNuevo(UsuarioDTO usuarioDto) throws UsuarioExistenteException;
    public boolean existeEmail(String email);
    public Usuario getUsuarioPorUsername(String username);
}
