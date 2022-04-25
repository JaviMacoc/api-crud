package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Cliente;
import com.bavseal.model.Pedido;
import java.util.List;

public interface PedidoService {

    public void guardar(Pedido pedido);
    public List<Pedido> listarPedidos();
    public Pedido buscarPorId(int id) throws RecursoNoEncontradoException;        
    public void borrar(int id);
    public void actualizar(Pedido pedido) throws RecursoNoEncontradoException;
}
