<!--Directivas y Taglibs de la vista-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CompuMundoHiperMegaRed</title>    
        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
        <!--FontAwesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        <!--CSS Propio-->
        <spring:url value="/css/index.css" var="cssExt"></spring:url>
        <link href="${cssExt}" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--Header importado-->
        <%@include file="../header.jsp"%>
        <!--Formulario Agregar Cliente-->
        <div class="container">                 
            <h5 class="modal-title">Nuevo Pedido</h5>                
            <div class="row g-3">    
                <div class="col col-6 col-md-3">
                    <label>Fecha</label>
                    <input type="text"/>
                </div>
                <div class="col col-6 col-md-3">
                    <label>Cliente</label>
                    <input type="text"/>
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
                                    <td class="tdBtn"><button type="button" class="btn btn-outline-dark btn-sm editarFila"><i class="fa-solid fa-pen-to-square"></i></button></td>                
                                </tr>
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

            </div>
        </div> 
        <div class="container">
            <input type="hidden" value="${pedido.id}"/>
            <button type="button" class="btn btn-info" id="btnAgregarLinea" >AgregarLinea</button>
            <button type="submit" class="btn btn-primary">Crear</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </div>
        <div class="container">
            <button class="btn btn-outline-dark btn-sm" id="btn1"><i class="fa-solid fa-pen-to-square"></i></button>               
            <button class="btn btn-outline-dark btn-sm" id="btn2"><i class="fa-solid fa-pen-to-square"></i></button>              
            <button class="btn btn-outline-dark btn-sm" id="btn3"><i class="fa-solid fa-pen-to-square"></i></button>                   
            <button class="btn btn-outline-dark btn-sm" id="btn4"><i class="fa-solid fa-pen-to-square"></i></button>                   
        </div>  
    </div>
    <!--Script BootStrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <!--Script JQuery-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--Script propio-->
    <script src="/js/pedidos.js"></script>
</body>
</html>