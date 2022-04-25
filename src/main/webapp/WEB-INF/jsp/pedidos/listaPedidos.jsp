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
        <title>Pedidos</title>
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
        <%@include file="../header.jsp"%>
        <div class="container">
            <div class="my-4">
                <h4>Pedidos</h4>
            </div>
            <div class="table-responsive w-md-75 mx-auto">
                <table class="table-striped table-hover table-borderless table-sm">
                    <thead style="border-bottom: 2px solid #000">
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Cliente</th>
                    <th>Total</th>
                    <th>#</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${listaDePedidos}" var="pedido">
                            <tr>                            
                                <td><c:out value="${pedido.id}"></c:out></td>
                                <td><c:out value="${pedido.fecha}"></c:out></td>
                                <td><c:out value="${pedido.cliente.nombre} ${pedido.cliente.apellido} "></c:out></td>
                                <td><c:out value="${pedido.total}"></c:out></td>
                                    <td class="tdBtn"><button class="btn btn-outline-dark btnEliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar">
                                            <i class="fa-solid fa-trash-can"></i>
                                        </button>
                                        <input type="hidden" value="${pedido.id}"/>
                                    <button class="btn btn-outline-dark btnActualizar" data-bs-toggle="modal" data-bs-target="#modalModificar">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                    <input type="hidden" id="id" value="${pedido.id}"/>
                                </td>
                            </tr>                    
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-grid justify-content-end mx-auto w-75">
                <button id="btnAgregar" type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalAgregar">Nuevo Pedido</button>
                <a href="/pedidos/nuevoPedido" id="btnAgregar2" type="button" class="btn btn-outline-primary btn-sm">Agregar Pedido</a>
            </div>
            <!--Modal Eliminar Articulo-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalEliminar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form:form method="get" action="eliminar">
                            <div class="modal-header">
                                <div class="modal-title">
                                    <h5>Eliminar pedido</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                            </div>
                            <div class="modal-body">
                                <p>Desea eliminar este pedido</p>                            
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="${pedido.id}">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form:form>
                    </div>                
                </div>            
            </div>
            <!--Modal Agregar-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" id="modalAgregar">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <form:form  method="post" target="agregar" modelAttribute="pedido">
                            <div class="modal-header">                                                           
                                <h5 class="modal-title">Nuevo Pedido</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                           
                            </div>
                            <div class="modal-body">                                
                                <c:import url="nuevoPedido.jsp"></c:import>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="${pedido.id}"/>
                                <button type="button" class="btn btn-info" id="btnAgregarLinea" >AgregarLinea</button>
                                <button type="submit" class="btn btn-primary">Crear</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form:form>
                    </div>                
                </div>            
            </div>
            <!--Modal Agregar.ElegirArticulo -->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalAgregarElegirArticulo">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">                    
                        <div class="modal-header">                                                           
                            <h5 class="modal-title">Elegir Articulo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                            
                        </div>
                        <div class="modal-body">
                            <label>Algo</label>
                            <input type="text"/>
                            <label>AlgoMas</label>
                            <input type="text"/>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="${pedido.id}"/>
                            <button type="submit" class="btn btn-primary">Crear</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>                    
                    </div>                
                </div>            
            </div>
            <!--Modal Modificar-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalModificar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form:form method="post" target="/modificar" modelAttribute="${pedido}">
                            <div class="modal-header">                            
                                <h5 class="modal-title">Modificar Pedido</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                           
                            </div>
                            <div class="modal-body">                                
                                <c:import url="modificarPedido.jsp"></c:import>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="${pedido.id}"/>
                                <button type="submit" class="btn btn-success">Guardar</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>                                
                            </div>
                        </form:form>
                    </div>
                </div>
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