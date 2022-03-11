package com.bavseal.security;

import com.bavseal.model.Usuario;
import com.bavseal.repository.UsuarioDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UsuarioDao usuarioDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioDao.findByUsername(username);        
        UserBuilder builder = null;
        
        if(usuario != null){
            builder = User.withUsername(username);
            builder.disabled(false);            
            builder.password(usuario.getPassword());            
            builder.authorities(new SimpleGrantedAuthority(usuario.getRol().toString()));
            builder.accountExpired(false);
            builder.accountLocked(false);
            builder.credentialsExpired(false);                        
            
        }else
         {
            throw new UsernameNotFoundException("Los datos ingresados son inválidos");
        }
       
        return builder.build();
    }
}
