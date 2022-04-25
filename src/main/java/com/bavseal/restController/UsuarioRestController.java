package com.bavseal.restController;

import com.bavseal.model.Usuario;
import com.bavseal.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioRestController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping(value = "/username/{username}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Usuario> getPorUsername(@PathVariable("username") String username) {
        try {
            return new ResponseEntity<>(usuarioService.findByUsername(username), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }
}
