<div class="row g-3">                        
        <form:hidden path="id"/>
        <div class="col-12 col-md-6">
            <form:label path="nombre" cssClass="form-label">Nombre</form:label>
            <form:input path="nombre" cssClass="form-control" required="true"/>
            <div class="invalid-feedback">
                Debe ingresar el nombre del producto.
            </div>
        </div>
        <div class="col d-none">
            <form:label path="envase" cssClass="form-label">Envase</form:label>
            <form:select path="envase" cssClass="form-select" required="true" value="1">
                <option value="-">Elija...</option>
                <option selected>1</option>
                <option>5</option>
                <option>10</option>
            </form:select>
            <div class="invalid-feedback">
                Elija el envasado del producto.
            </div>
        </div>
        <div class="col-12 col-md-6">
            <form:label path="stock" cssClass="form-label">Stock</form:label>
            <div class="input-group has-validation">
                <form:input path="stock" type="number" cssClass="form-control" required=""/>
                <div class="invalid-feedback">
                    Inserte una cantidad.
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6">
            <form:label path="tipoDeArticulo" cssClass="form-label">Tipo de articulo</form:label>
            <form:select path="tipoDeArticulo" cssClass="form-select" required="true">
                <c:forEach items="${tiposDeArticulo}" var="tipoDeArticulo">
                    <form:option label="${tipoDeArticulo.nombre}" value="${tipoDeArticulo}"></form:option>
                </c:forEach>              
            </form:select>
            <div class="invalid-feedback">
                Elija la categoría del artículo.
            </div>
        </div>
        <div class="col-12 col-md-6">
            <form:label path="costo" cssClass="form-label">Costo</form:label>
            <form:input path="costo" id="costo" type="number" cssClass="form-control" name="costo" required="true"/>
            <div class="invalid-feedback">
                Ingrese el valor del costo del artículo.
            </div>
        </div>

        <div class="col-12 col-md-6">
            <form:label path="margen" cssClass="form-label">Margen<span class="text-muted">(Opcional)</span></form:label>                       
            <form:input path="margen" id="margen" type="number" cssClass="form-control" name="margen"/>
        </div>
        <div class="col-12 col-md-6">
            <form:label path="precio" cssClass="form-label">Precio</form:label>
            <form:input path="precio" type="number" value="10" cssClass="form-control" />                            
        </div>
    </div>

