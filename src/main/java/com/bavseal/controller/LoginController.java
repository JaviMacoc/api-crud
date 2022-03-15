package com.bavseal.controller;

import com.bavseal.dto.UsuarioDTO;
import com.bavseal.model.Usuario;
import com.bavseal.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class LoginController {

    @Autowired
    UsuarioService usuarioService;

    @GetMapping("/login")
    public String loginForm(Model model, HttpServletRequest request) {
        if (!model.containsAttribute("usuarioDto")) {
            model.addAttribute("usuarioDto", new UsuarioDTO());
        }
        return "login";
    }

    @GetMapping("/usuarioLogin")
    public String login(RedirectAttributes attr, Authentication auth, HttpSession session) {
        String username;
        if (auth.getName() != null) {
            username = auth.getName();
            if (session.getAttribute("usuario") == null) {
                Usuario usuario = usuarioService.findByUsername(username);
                usuario.setPassword(null);
                session.setAttribute("usuario", usuario);
            }
        } else {
            return "redirect:/login?error";
        }
        return "index";
    }

    @PostMapping("/loginFail")
    public String loginFail(@ModelAttribute("usuarioDto") UsuarioDTO usuarioDto, RedirectAttributes attr) {
        String errorLogin = "Los datos ingresados son inválidos";
        attr.addFlashAttribute("usuarioDto", usuarioDto);
        attr.addFlashAttribute("errorLogin", errorLogin);

        return "redirect:/login?error";
    }

    @GetMapping("/accesoNoAutorizado")
    public String accesoNoAutorizado(Model model, HttpServletRequest request){
        String url = request.getHeader(HttpHeaders.LOCATION);
        model.addAttribute("url", url);
        
        return "accesoNoAutorizado";
    }
}
