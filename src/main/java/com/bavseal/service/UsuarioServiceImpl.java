package com.bavseal.service;

import com.bavseal.exceptions.UsuarioExistenteException;
import com.bavseal.model.Usuario;
import com.bavseal.dto.UsuarioDTO;
import com.bavseal.model.Rol;
import com.bavseal.repository.UsuarioDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService{

    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    

    @Override
    public Usuario registrarUsuario(UsuarioDTO usuarioDto) throws UsuarioExistenteException {
        if (existeEmail(usuarioDto.getEmail())) {
            throw new UsuarioExistenteException(usuarioDto.getEmail());            
        } else {
            Usuario usuario = new Usuario();
            usuario.setUsername(usuarioDto.getEmail());
            usuario.setNombre(usuarioDto.getNombre());
            usuario.setApellido(usuarioDto.getApellido());
            usuario.setEmail(usuarioDto.getEmail());
            usuario.setPassword(passwordEncoder.encode(usuarioDto.getPassword()));
            if(usuario.getNombre().contains("admin")){
                usuario.setRol(Rol.ROLE_ADMIN);
            }else{
            usuario.setRol(Rol.ROLE_USER);
            }

            return usuarioDao.save(usuario);
        }
    }

    @Override
    public boolean existeEmail(String email) {
        return usuarioDao.findByEmail(email) != null;
    }
    
    @Override
    public Usuario findByUsername(String username){
        return usuarioDao.findByUsername(username);
    }
}
