package com.bavseal.controller;

import com.bavseal.dto.UsuarioDTO;
import com.bavseal.model.Rol;
import com.bavseal.model.Usuario;
import com.bavseal.service.UsuarioService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class LoginController {

    @Autowired
    UsuarioService usuarioService;

    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("rolUsuario", Rol.ROLE_USER);
        if (!model.containsAttribute("usuarioDto")) {
            model.addAttribute("usuarioDto", new UsuarioDTO());
        }
        return "login";
    }

    @GetMapping("/home")
    public String login(Model model, Authentication auth, HttpSession session) {
        String username;
        if (auth.getName() != null) {
            username = auth.getName();
            if (session.getAttribute("usuario") == null) {
                Usuario usuario = usuarioService.findByUsername(username);
                usuario.setPassword(null);
                session.setAttribute("usuario", usuario);
                model.addAttribute("session", session);
                System.out.println(session.getId());
                System.out.println(session.getAttribute("usuario").toString());
            }
        }
        return "index";
    }

}
