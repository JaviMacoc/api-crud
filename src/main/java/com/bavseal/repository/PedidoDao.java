package com.bavseal.repository;

import com.bavseal.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("pedidoDao")
public interface PedidoDao extends JpaRepository<Pedido, Integer>{

}
