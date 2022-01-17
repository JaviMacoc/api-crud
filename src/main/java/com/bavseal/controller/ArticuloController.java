package com.bavseal.controller;

import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import com.bavseal.repository.DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//@RestController
@Controller
public class ArticuloController {

    @Autowired
    DAO articuloDao;

    @GetMapping("aa")
    public String buscameEstaPagina() {
        return "agregarArticulos";
    }

    @GetMapping("otra")
    public String buscameEstaPagina2() {
        return "otraJsp";
    }

    @PostMapping("agregar")
    public String agregar(@RequestParam("id") String id, @RequestParam("nombre") String nombre,
             @RequestParam("envase") String envase, @RequestParam("cantidad") String stock,
             @RequestParam("tipoDeArticulo") String tipoDeArticulo, @RequestParam("costo") String costo,
             @RequestParam("margen") String margen, @RequestParam("precio") String precio) {
        Articulo articulo = new Articulo();
        articulo.setId(Integer.parseInt(id));
        articulo.setNombre(nombre);
        articulo.setEnvase(Integer.parseInt(envase));        
        articulo.setStock(Integer.parseInt(stock));
        switch (tipoDeArticulo) {
            case "Frutos Secos":
                articulo.setTipoDeArticulo(TipoDeArticulo.FRUTOS_SECOS);
                break;
            case "Frutas Desecadas":
                articulo.setTipoDeArticulo(TipoDeArticulo.FRUTAS_DESECADAS);
                break;
            case "Semillas":
                articulo.setTipoDeArticulo(TipoDeArticulo.SEMILLAS);
                break;
            default:
                articulo.setTipoDeArticulo(null);
        }
        articulo.setCosto(Float.parseFloat(costo));
        if (margen == "") {
            System.out.println("El margen null se convierte a 0");
        }
        if (precio.equals("")) {
            System.out.println("El precio null se convierte a 0");
        }
        System.out.println("");
        System.out.println(articulo);
        System.out.println("");
        articuloDao.crear(articulo);
        
        return "otraJsp";
    }

    @DeleteMapping(value = "eliminar")
    public void eliminar(Articulo p) {
        articuloDao.borrar(p.getId());
    }

    @GetMapping("/consultarArticulos")
    public String consultarArticulos() {
        System.out.println("Esto funciona?");
        return "Esto funciona";
    }

    @GetMapping(value = "consultarArticulosPorParam")
    public String consultarArticulosPorParam(@RequestParam String param) {
        System.out.println("Esto funciona?");
        return "Esto funciona";
    }

    public Articulo actualizar(@RequestParam String nombre, @RequestParam int stock, @RequestParam float costo, @RequestParam int margen, @RequestParam float precio) {
        Articulo articulo = new Articulo();
        if (!nombre.equals("")) {
            articulo.setNombre(nombre);
        }
        if (stock == 0) {
            articulo.setStock(stock);
        }
        if (costo == 0) {
            articulo.setCosto(costo);
        }
        if (margen == 0) {
            articulo.setPrecioAPartirDelMargen(margen);
        }
        if (!(precio == 0)) {
            articulo.setMargenAPartirDelPrecio(precio);
        }
        return articulo;
    }
}
