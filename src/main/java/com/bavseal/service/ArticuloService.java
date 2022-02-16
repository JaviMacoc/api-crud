package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import java.util.List;

public interface ArticuloService {
    public void guardar(Articulo articulo);
    public List<Articulo> consultarArticulos();
    public Articulo buscarPorId(int id) throws RecursoNoEncontradoException;    
    public List<Articulo> buscarPorTipoDeArticulo(TipoDeArticulo tda);    
    public void borrar(int id);        
    public void editar(Articulo articulo) throws RecursoNoEncontradoException;     
}
