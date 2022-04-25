package com.bavseal.restController;

import com.bavseal.model.Pedido;
import com.bavseal.service.PedidoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/pedidos")
public class PedidoRestController {
    
    @Autowired
    PedidoService pedidoService;
    
    @GetMapping("/todos")
    public ResponseEntity<List<Pedido>> listaPedidos(){       
            return new ResponseEntity(pedidoService.listarPedidos(), HttpStatus.OK);      
    }
}
