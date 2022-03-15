<div class="row g-3">    
    <div class="col-12 col-md-6">
        <label class="form-label">Id</label>
        <input id="id" name="id" class="form-control" required="true"/>
        <div class="invalid-feedback">
            Este campo es obligatorio.
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Nombre</label>
        <input id="nombre" name="nombre" class="form-control" required="true"/>
        <div class="invalid-feedback">
            Debe ingresar el nombre del producto.
        </div>
    </div>
    <div class="col d-none">
        <label class="form-label">Envase</label>
        <select  id="envase" name="envase" class="form-select" required="true" value="1">
            <option value="-">Elija...</option>
            <option selected>1</option>
            <option>5</option>
            <option>10</option>
        </select>
        <div class="invalid-feedback">
            Elija el envasado del producto.
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Stock</label>
        <div class="input-group has-validation">
            <input id="stock" name="stock" type="number" class="form-control" required="true"/>
            <div class="invalid-feedback">
                Defina una cantidad.
            </div>
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Tipo de articulo</label>
        <select id="tipoDeArticulo" name="tipoDeArticulo" class="form-select" required="true">            
            <c:forEach items="${tiposDeArticulo}" var="tipoDeArticulo">
                <c:set value="${tipoDeArticulo}" var="tda" scope="request"></c:set>
                <option label="${tda.nombre}" value="${tda}"></option>
            </c:forEach>         
        </select>
        <div class="invalid-feedback">
            Elija la categoría del artículo.
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Costo</label>
        <input id="costo" name="costo" type="number" class="form-control" required="true"/>
        <div class="invalid-feedback" >
            Ingrese el valor del costo del artículo.
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Margen<span class="text-muted">(Opcional)</span></label>                       
        <input id="margen" name="margen" type="number" class="form-control" value="0" required="true"/>
        <div class="invalid-feedback" >
            Ingrese un valor. Si desea definir el margen a partir del precio, digite 0.
        </div>
    </div>
    <div class="col-12 col-md-6">
        <label class="form-label">Precio</label>
        <input id="precio" name="precio" type="number" class="form-control" value="0" required="true"/> 
        <div class="invalid-feedback" >
            Ingrese un valor. Si desea definir el precio a partir del margen, digite 0.
        </div>
    </div>
</div>        

