package com.bavseal.controller;

import com.bavseal.dto.UsuarioDTO;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class LoginController {
    
    @GetMapping("/loginForm")
    public String loginForm(Model model){
       model.addAttribute("usuario", new UsuarioDTO());
       return "login";
    }
    
    @PostMapping("/login")
    public String loginPost(@Valid @ModelAttribute("usuario") UsuarioDTO usuarioDto, RedirectAttributes attr, BindingResult result){
        if(result.hasErrors()){
            return("redirect:/loginForm");
        }
        
        return "redirect:/";
    }   
    
}
