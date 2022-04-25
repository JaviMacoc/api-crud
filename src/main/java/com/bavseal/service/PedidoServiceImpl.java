package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Pedido;
import com.bavseal.repository.PedidoDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PedidoServiceImpl implements PedidoService{

    @Autowired
    PedidoDao pedidoDao;
    
    @Override
    public void guardar(Pedido pedido) {
        pedidoDao.save(pedido);
    }

    @Override
    public List<Pedido> listarPedidos() {
        return pedidoDao.findAll();
    }

    @Override
    public Pedido buscarPorId(int id) throws RecursoNoEncontradoException {
        return pedidoDao.findById(id).orElseThrow(()->
            new RecursoNoEncontradoException(id));        
    }

    @Override
    public void borrar(int id) {        
        pedidoDao.deleteById(id);
    }

    @Override
    public void actualizar(Pedido pedido) throws RecursoNoEncontradoException {
        Pedido pedidoDB = buscarPorId(pedido.getId());
        pedidoDB.setId(pedido.getId());
        pedidoDB.setFecha(pedido.getFecha());
        pedidoDB.setCliente(pedido.getCliente());
        pedidoDB.setLineaDeItems(pedido.getLineaDeItems());
        pedidoDB.setTotal(pedido.getTotal());
        pedidoDao.save(pedidoDB);
    }

}
