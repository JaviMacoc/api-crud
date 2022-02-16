package com.bavseal.restController;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Articulo;
import com.bavseal.service.ArticuloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/articulos")
public class ArticuloRestController {

    @Autowired
    private ArticuloService articuloService;
    
    @GetMapping(value="buscar/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Articulo> buscar(@PathVariable("id") int id){
        try {
            return new ResponseEntity<>(articuloService.buscarPorId(id),HttpStatus.OK);
        } catch (RecursoNoEncontradoException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
