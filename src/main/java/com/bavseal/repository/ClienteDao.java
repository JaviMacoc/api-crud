
package com.bavseal.repository;

import com.bavseal.model.Cliente;
import javax.persistence.EntityManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("clienteRepository")
public interface ClienteDao extends JpaRepository<Cliente, Integer> {
    
}
