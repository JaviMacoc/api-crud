package com.bavseal.repository;

import java.util.ArrayList;

public interface EntitiesDAO<E, K>{
    public void crear(E elemento);
    public ArrayList<E> getLista();
    public E buscarPorId(K id);
    public void actualizar(E articulo);
    public void borrar(K id);     
}
