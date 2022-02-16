package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Cliente;
import com.bavseal.repository.ClienteDao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClienteServiceImpl implements ClienteService {

    @Autowired
    EntityManager em;
    @Autowired
    ClienteDao clienteDao;
    
    @Override
    public void guardar(Cliente cliente) {
        clienteDao.save(cliente);        
    }
    
    @Override
    public List<Cliente> consultarClientes() {
        return clienteDao.findAll();        
    }
    
    @Override
    public Cliente buscarPorId(int id) throws RecursoNoEncontradoException {
        
        return clienteDao.findById(id).orElseThrow(
                () -> new RecursoNoEncontradoException(id));        
        
    }
    
    @Override
    public void borrar(int id) {
        clienteDao.deleteById(id);
    }
    
    @Override
    @Transactional
    public void actualizar(Cliente cliente) throws RecursoNoEncontradoException {
        Cliente clienteDb = clienteDao.findById(cliente.getId()).orElseThrow(
                () -> new RecursoNoEncontradoException(cliente.getId()));
        clienteDb.setNombre(cliente.getNombre());
        clienteDb.setApellido(cliente.getApellido());
        clienteDb.setEmail(cliente.getEmail());
        clienteDb.setDireccion(cliente.getDireccion());
        clienteDb.setTelefono(cliente.getTelefono());
        clienteDao.save(clienteDb);
    }
    
}
