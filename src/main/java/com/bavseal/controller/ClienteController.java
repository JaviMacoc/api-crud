package com.bavseal.controller;

import com.bavseal.exceptions.RecursoNoEncontradoException;
import com.bavseal.model.Cliente;
import com.bavseal.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/clientes")
public class ClienteController {  
   @Autowired
   ClienteService clienteService;
   
    @GetMapping("/agregarClienteForm")
    public String agregarArticuloForm(Model model){
        Cliente cliente = new Cliente();
        model.addAttribute("clienteNuevo", cliente);
        return "agregarCliente";
    }
    
    @PostMapping("/agregar")
    public String agregar(@ModelAttribute("clienteNuevo") Cliente cliente) {
        clienteService.guardar(cliente);
        return "redirect:/clientes/listaDeClientes";
    }

    @GetMapping("/listaDeClientes")
    public String consultarArticulos(Model model) {
        model.addAttribute("clientes", clienteService.consultarClientes());        
        return "listaClientes";
    }
    
    @GetMapping(value = "/eliminar")
    public String eliminar(@RequestParam("clienteId") int id) {
        clienteService.borrar(id);
        return "redirect:/clientes/listaDeClientes";
    }
    
    @GetMapping("actualizarClienteForm")    
    public String actualizarClienteForm(@RequestParam ("clienteId") int id, Model model) throws RecursoNoEncontradoException{
        Cliente cliente = (Cliente) clienteService.buscarPorId(id);
        model.addAttribute("clienteUpdt", cliente);
         
        return "actualizarCliente";
    }
    @PostMapping("actualizar")
    public String actualizar(@ModelAttribute("clienteUpdt") Cliente cliente) throws RecursoNoEncontradoException {
        clienteService.actualizar(cliente);
        return "redirect:/clientes/listaDeClientes";
    }
}

