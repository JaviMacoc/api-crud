package com.bavseal.service;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Cliente;
import java.util.List;

public interface ClienteService {
    public void guardar(Cliente cliente);
    public List<Cliente> consultarClientes();
    public Cliente buscarPorId(int id) throws RecursoNoEncontradoException;        
    public void borrar(int id);
    public void actualizar(Cliente cliente)throws RecursoNoEncontradoException;
}
