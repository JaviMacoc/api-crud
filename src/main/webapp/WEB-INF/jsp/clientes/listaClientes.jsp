<!--Directivas y Taglibs de la vista-->
<%@page import="com.bavseal.model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CompuMundoHiperMegaRed Clientes</title>    
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
        <!--Tabla de Clientes-->
        <div class="container">
            <div class="my-4">
                <h4>Clientes</h4>
            </div>
            <div class="table-responsive w-md-75 mx-auto">
                <table class="table table-striped table-hover table-borderless table-sm">
                    <thead style="border-bottom: 2px solid #000">
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>                            
                            <th>Apellido</th>
                            <th>Email</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <!--Cuerpo de la tabla-->
                    <tbody>
                        <c:forEach items="${clientes}" var="cliente">
                            <tr>
                                <td><c:out value="${cliente.id}"></c:out></td>
                                <td><c:out value="${cliente.nombre}"></c:out></td>                                
                                <td><c:out value="${cliente.apellido}"></c:out></td>
                                <td><c:out value="${cliente.email}"></c:out></td>
                                <td><c:out value="${cliente.direccion}"></c:out></td>
                                <td><c:out value="${cliente.telefono}"></c:out></td>
                                <!--Botones de Eliminar y Actualizar-->                                                                
                                <td><button class="btn btn-outline-dark text-decoration-none btnEliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar">                                        
                                        <i class="fas fa-trash-alt"></i>
                                </button>
                                <input type="hidden" id="id" value="${cliente.id}"/>
                                <input type="hidden" id="nombre" value="${cliente.nombre}"/>
                                <input type="hidden" id="apellido" value="${cliente.apellido}"/>
                                </button>
                                <spring:url var="actualizarEsteCliente" value="/clientes/actualizarClienteForm?${clienteId}"><spring:param name="clienteId" value="${cliente.id}"/></spring:url>
                                <a href="${actualizarEsteCliente}" type="button" class="btn btn-outline-dark text-decoration-none">
                                    <i class="fas fa-edit"></i>                               
                                </a></td>                                    
                            </tr>                              
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-grid justify-content-end mx-auto w-75 my-3">
                <a class="btn btn-outline-primary btn-sm" role="button" href="/clientes/agregarClienteForm">Agregar Cliente <i class="fas fa-plus"></i></a>
            </div>
            <!--Modal Eliminar Articulo-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalEliminar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form:form action="eliminar" method="GET">
                            <div class="modal-header">                            
                                <h5 class="modal-title">Eliminar cliente</h5>                            
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                            
                            </div>
                            <div class="modal-body" id="eliminarCliente">                                                          
                            </div>
                            <div class="modal-footer">                            
                                <input type="hidden" name="id" id="clienteId"/>                                
                                <input type="submit" class="btn btn-danger" value="Eliminar"></input>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>                            
                            </div>
                        </form:form>
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
            <script src="/js/clientes.js"></script>
    </body>

</html>