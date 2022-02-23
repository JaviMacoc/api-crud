package com.bavseal.repository;

import com.bavseal.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("usuarioRepository")
public interface UsuarioDao extends JpaRepository<Usuario, String>{

    public Usuario findByEmail(String email);

    public Usuario findByUsername(String username);

}
