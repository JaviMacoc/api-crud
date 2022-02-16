package com.bavseal.controller;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import com.bavseal.service.ArticuloService;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.bavseal.util.DesignadorDeId;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/articulos")
public class ArticuloController implements Serializable {

    private static final long serialVersionUID = 1L;

    @Autowired
    private ArticuloService articuloService;
    @Autowired
    private DesignadorDeId designadorDeId;

    @PostMapping("/agregar")
    public String agregar(@ModelAttribute("articuloNuevo") Articulo articulo) {
        articulo.setId(designadorDeId.designador(articulo));
        articulo.setPrecioAPartirDelMargen(articulo.getMargen());
        if (articulo.getMargen() == 0) {
            articulo.setMargenAPartirDelPrecio(articulo.getPrecio());
        }
        articuloService.guardar(articulo);
        return "redirect:/articulos/listaDeArticulos";
    }

    @GetMapping("/listaDeArticulos")
    public String consultarArticulos(Model model, Model model2) {
        model.addAttribute("articulos", articuloService.consultarArticulos());
        Articulo articulo = new Articulo();
        model2.addAttribute("articulo", articulo);
        model2.addAttribute("tiposDeArticulo", TipoDeArticulo.values());
        return "listaArticulos";
    }

    @GetMapping(value = "/eliminar")
    public String eliminar(@RequestParam("id") String id) {
        Integer articuloId = Integer.parseInt(id);
        articuloService.borrar(articuloId);
        return "redirect:/articulos/listaDeArticulos";
    }

    @PostMapping(value = "actualizar")
    public String actualizar(@RequestParam("id") int id, @RequestParam("nombre") String nombre,
            @RequestParam("envase") int envase,@RequestParam("stock") int stock,
            @RequestParam("tipoDeArticulo") TipoDeArticulo tipoDeArticulo, @RequestParam("costo") float costo,
            @RequestParam("margen") int margen,@RequestParam("precio") float precio) throws RecursoNoEncontradoException {
        Articulo articulo = new Articulo();
        articulo.setId(id);
        articulo.setNombre(nombre);
        articulo.setEnvase(envase);
        articulo.setStock(stock);
        articulo.setTipoDeArticulo(tipoDeArticulo);
        articulo.setCosto(costo);
        articulo.setPrecioAPartirDelMargen(margen);
        if (margen == 0) {
            articulo.setMargenAPartirDelPrecio(precio);
        }               
        articuloService.editar(articulo);
        return "redirect:/articulos/listaDeArticulos";
    }
}
