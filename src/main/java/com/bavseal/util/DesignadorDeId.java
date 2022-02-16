package com.bavseal.util;

import com.bavseal.model.Articulo;
import com.bavseal.service.ArticuloService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DesignadorDeId {

    @Autowired
    ArticuloService articuloService;       
            
  

    public int designador(Articulo articulo) {
        List <Articulo> lista = articuloService.buscarPorTipoDeArticulo(articulo.getTipoDeArticulo());
        int idNuevoArticulo = (lista.get(lista.size()-1).getId() + 1);
        return idNuevoArticulo;
    }
}
