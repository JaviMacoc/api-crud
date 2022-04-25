package com.bavseal.controller;

import com.bavseal.model.Pedido;
import com.bavseal.service.ArticuloService;
import com.bavseal.service.PedidoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pedidos")
public class PedidoController {

    @Autowired
    PedidoService pedidoService;
    @Autowired
    ArticuloService articuloService;
    
    @GetMapping("/listaPedidos")
    public String listaPedidos(Model model){
        Pedido pedido = new Pedido();
        model.addAttribute("pedido", pedido); 
        model.addAttribute("listaDePedidos", pedidoService.listarPedidos()); 
        model.addAttribute("articulos", articuloService.consultarArticulos()); 
        //CARGAR SOLO LOS PEDIDOS DEL DIA ANTERIOR EN ADELANTE
        return "/pedidos/listaPedidos";
    }
    
    @GetMapping("/eliminar")
    public String eliminar(int id){
        pedidoService.borrar(id);        
        return "redirect:/pedidos/listaPedidos";
    }
    
    @GetMapping("nuevoPedido")
    public String nuevoPedido(Model model){
        Pedido pedido = new Pedido();
        model.addAttribute("pedido", pedido);
        return "/pedidos/agregarPedido";
    }
    
    @PostMapping("agregar")
    public String agregar(@ModelAttribute Pedido pedido){
        pedidoService.guardar(pedido);
        return "redirect:/pedidos/listaPedidos";
    }
    
    
    
}
