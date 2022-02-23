package com.bavseal.controller;

import com.bavseal.model.Usuario;
import com.bavseal.service.UsuarioService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class AutorizacionController {

    @Autowired
    private UsuarioService usuarioService;
    
    @GetMapping("registroCorrecto")
    public String bienvenidaUsuario(Authentication auth, HttpSession session){
        
        String username = auth.getName();
        
        if(session.getAttribute(username)==null){
            Usuario usuario = usuarioService.getUsuarioPorUsername(username);
            usuario.setPassword(null);
            session.setAttribute("usuario", usuario);
        }
        
        return "registroCorrecto";
    }
}
