package com.bavseal.controller;

import com.bavseal.exceptions.UsuarioExistenteException;
import com.bavseal.dto.UsuarioDTO;
import com.bavseal.service.UsuarioServiceImpl;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
public class RegistroController {

    @Autowired
    private UsuarioServiceImpl usuarioService;

    @GetMapping("/registroForm")
    public String registrarForm(Model model) {
        UsuarioDTO usuarioDto = new UsuarioDTO();
        if(!model.containsAttribute("usuarioDto")){
        model.addAttribute("usuarioDto", usuarioDto);
        }        
        return "registro";
    }

    @PostMapping("/registrarUsuario")
    public String registrarUsuario(@Valid @ModelAttribute("usuarioDto") UsuarioDTO usuarioDto, BindingResult result,
            RedirectAttributes attr, Model model) throws UsuarioExistenteException {
        if (result.hasErrors()) {            
            attr.addFlashAttribute("org.springframework.validation.BindingResult.usuarioDto", result);
            attr.addFlashAttribute("usuarioDto", usuarioDto);            
            return "redirect:/registroForm";
        } else {
            usuarioDto.setUsername(usuarioDto.getEmail());
            List<UsuarioDTO> usuarios = new ArrayList<>();
            usuarios.add(usuarioDto);
            usuarioService.registrarUsuario(usuarioDto);            
            attr.addFlashAttribute("usuarios", usuarios);
            attr.addFlashAttribute("usuarioDto", usuarioDto);
            return "redirect:/loginForm";
        }
    }
}
