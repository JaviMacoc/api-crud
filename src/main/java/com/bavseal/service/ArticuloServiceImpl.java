package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import com.bavseal.repository.ArticuloDao;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticuloServiceImpl implements ArticuloService {

    @Autowired
    private ArticuloDao articuloDao;
    @Autowired
    private EntityManager em;
    
    @Override
    public void guardar(Articulo articulo) {
        articuloDao.save(articulo);        
    }

    @Override
    @Transactional
    public List<Articulo> consultarArticulos() {
        List<Articulo> lista = articuloDao.findAll();
        return lista;
    }

    @Override
    @Transactional
    public Articulo buscarPorId(int id) throws RecursoNoEncontradoException {       
            return articuloDao.findById(id).orElseThrow(
            ()-> new RecursoNoEncontradoException(id));
    }
    
    @Override
    @Transactional
    public List<Articulo> buscarPorTipoDeArticulo(TipoDeArticulo tda) {
        return articuloDao.buscarPorTipoDeArticulo(tda);        
    }
    
    @Override
    @Transactional
    public void borrar(int id) {        
       articuloDao.deleteById(id);
    }
    @Override
    @Transactional
    public void actualizar(Articulo articulo) {
        String query = "SELECT a FROM Articulo a WHERE id = :id";
        Articulo articuloDb = (Articulo) em.createQuery(query).setParameter("id", articulo.getId()).getResultList().get(0);        
        articuloDb.setNombre(articulo.getNombre());
        articuloDb.setEnvase(articulo.getEnvase());
        articuloDb.setStock(articulo.getStock());
        articuloDb.setTipoDeArticulo(articulo.getTipoDeArticulo());
        articuloDb.setCosto(articulo.getCosto());
        articuloDb.setMargen(articulo.getMargen());
        articuloDb.setPrecio(articulo.getPrecio());        
        em.merge(articuloDb);        
    }

    @Override
    public void editar(Articulo articulo) throws RecursoNoEncontradoException {
        Articulo articuloDb = articuloDao.findById(articulo.getId()).orElseThrow(
        ()-> new RecursoNoEncontradoException(articulo.getId()));        
        articuloDb.setNombre(articulo.getNombre());
        articuloDb.setEnvase(articulo.getEnvase());
        articuloDb.setStock(articulo.getStock());
        articuloDb.setTipoDeArticulo(articulo.getTipoDeArticulo());
        articuloDb.setCosto(articulo.getCosto());
        articuloDb.setMargen(articulo.getMargen());
        articuloDb.setPrecio(articulo.getPrecio());
        articuloDao.save(articuloDb);        
    }

}
