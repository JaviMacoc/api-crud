package com.bavseal.controller;

import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import java.io.Serializable;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.bavseal.repository.EntitiesDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class ArticuloController implements Serializable {

    private static final long serialVersionUID = 1L;

    @Autowired
    EntitiesDAO articuloDao;    
    ArrayList<Articulo> listaDeArticulos;

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

        for (TipoDeArticulo tda : TipoDeArticulo.values()) {
            if (tda.getTipoDeProducto().equals(tipoDeArticulo)) {
                articulo.setTipoDeArticulo(tda);
            }
        }
        articulo.setCosto(Float.parseFloat(costo));
        articulo.setPrecioAPartirDelMargen(margen);
        if (articulo.getMargen() == 0) {
            articulo.setMargenAPartirDelPrecio(precio);
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

    @GetMapping("consultarArticulos")
    public String consultarArticulos(Model model) {
        model.addAttribute("articulos",articuloDao.getLista());
        return "actualizarArticulo";
    }
    @GetMapping("otraArticulos")
    public String otraArticulos(Model model) {
        model.addAttribute("articulos",articuloDao.getLista());
        return "otraJsp";
    }

    @GetMapping(value = "consultarArticulosPorParam")
    public void consultarArticulosPorParam(@RequestParam String param) {

    }

    @PostMapping("actualizar")

    public String actualizar(@RequestParam("texto") String chbxArticulo) {       

        return "otraJsp";
    }
}
