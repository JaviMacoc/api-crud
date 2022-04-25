package com.bavseal.repository;

import com.bavseal.model.Articulo;
import com.bavseal.model.TipoDeArticulo;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository("articuloRepository")
public interface ArticuloDao extends JpaRepository<Articulo, Integer>{   
    @Query("SELECT a FROM Articulo a WHERE tipoDeArticulo = :tda")
    public List<Articulo> buscarPorTipoDeArticulo(@Param("tda") TipoDeArticulo tda);    
}
