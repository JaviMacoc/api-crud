
package com.bavseal.repository;

import com.bavseal.model.Articulo;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;


import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ArticuloDaoImpl implements DAO<Articulo, Integer>{
    
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public void crear(Articulo articulo) {
        entityManager.persist(articulo);
    }

    @Override
    public ArrayList<Articulo> getLista() {
        String query = "FROM Articulo a";
        List<Articulo> busquedaDeArticulos = entityManager.createQuery(query)                
                .getResultList();
        return (ArrayList<Articulo>) busquedaDeArticulos;
    }
    @Override
    public Articulo buscarPorId(Integer id) {
        String query = "FROM Articulo a WHERE id = :id";
        List<Articulo> busquedaDeArticulos = entityManager.createQuery(query)
                .setParameter("id", id)
                .getResultList();        
        return busquedaDeArticulos.get(0);        
    }


    @Override
    public void actualizar(Articulo a) {
        String query = "FROM Articulo a WHERE id = :id";
        List<Articulo> busquedaDeArticulos = entityManager.createQuery(query)
                .setParameter("id", a.getId())
                .getResultList();        
        if(!busquedaDeArticulos.isEmpty()){
            entityManager.merge(a);
        }
        
    }

    @Override
    public void borrar(Integer id) {
        Articulo articulo = entityManager.find(Articulo.class, id);
        entityManager.remove(articulo);
    }    
    
} 

    


