<div class="row g-3">    
    <div class="col col-6 col-md-3">
        <form:label path="fecha" cssClass="form-label">Fecha</form:label>
        <form:input path="fecha" cssClass="form-control"/>
        <div class="invalid-feedback">
            Debe ingresar una fecha
        </div>
    </div>
    <div class="col col-6 col-md-3">
        <form:label path="cliente" cssClass="form-label">Cliente</form:label>
        <form:input path="cliente" cssClass="form-control"></form:input>
        <div class="invalid-feedback">
            Debe ingresar un cliente
        </div>
    </div>
    <!--Tabla de lineas del pedido-->
    <div class="col-12">
        <div class="container">
            <table class="table table-responsive table-striped table-hover table-sm">
                <thead>
                    <tr>
                        <th></th>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>PU</th>
                        <th>Subtotal</th>
                        <th>#</th>
                    </tr>
                </thead>
                <tbody id="tbody">                
                    <tr class="filaDeItem"  data-nroLinea="1">            
                        <td><div class="row_data">1</div></td>
                        <td><div class="row_data" data-col="idArt"></div></td>
                        <td><div class="row_data" data-col="nombreArt"></div></td>
                        <td><div class="row_data" data-col="cantidad"></div></td>
                        <td><div class="row_data" data-col="pu"></div></td>
                        <td><div class="row_data" data-col="subtotal"></div></td>
                        <td class="tdBtn"><button class="btn btn-outline-dark btn-sm" id="editarFila"><i class="fas-fa-edit"></i></button></td>                
                    <tr>
                </tbody>
            </table>            
            <div class="row justify-content-end mx-1">
                <div class="col-4 my-2  border border-2 p-2">
                    <label>Total: </label>
                    <span id="total"></span>
                </div>
            </div>
        </div>        
    </div>
    <div class="container">
        <button class="btn btn-outline-dark btn-sm" id="btn1"><i class="fas-fa-edit"></i></button>               
        <button class="btn btn-outline-dark btn-sm" id="btn2"><i class="fas-fa-edit"></i></button>              
        <button class="btn btn-outline-dark btn-sm" id="btn3"><i class="fas-fa-edit"></i></button>                   
    </div>    
</div>