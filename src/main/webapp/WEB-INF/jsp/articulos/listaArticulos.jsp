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
        <!--Tabla de Articulos-->
        <div class="container justify-content-center">
            <div class="my-4">
                <h4>Lista de Articulos</h4>
            </div>
            <div class="table-responsive w-md-75 mx-auto">
                <table class="table table-striped table-hover table-borderless table-sm">
                    <thead style="border-bottom: 2px solid #000">
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th class="d-none">Envase</th>
                            <th class="d-none d-md-table-cell">Stock</th>
                            <th class="d-none d-md-table-cell">Tipo de articulo</th>
                            <th>Costo</th>
                            <th class="d-none d-md-table-cell">Margen</th>
                            <th>Precio</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <!--Cuerpo de la tabla-->
                    <tbody>
                        <c:forEach items="${articulos}" var="articulo">
                            <tr>
                                <td><c:out value="${articulo.id}"></c:out></td>
                                <td><c:out value="${articulo.nombre}"></c:out></td>
                                <td class="d-none"><c:out value="${articulo.envase}"></c:out></td>
                                <td class="d-none d-md-table-cell"><c:out value="${articulo.stock}"></c:out></td>
                                <td class="d-none d-md-table-cell"><c:out value="${articulo.tipoDeArticulo}"></c:out></td>
                                <td><c:out value="${articulo.costo}"></c:out></td>
                                <td class="d-none d-md-table-cell"><c:out value="${articulo.margen}"></c:out></td>
                                <td><c:out value="${articulo.precio}"></c:out></td>
                                    <!--Botones de Eliminar y Actualizar-->                                                                
                                <td class="tdBtn"><button class="btn btn-outline-dark btnEliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar">                                        
                                    <i class="fa-solid fa-trash-can"></i>
                                    </button><input type="hidden" id="id" value="${articulo.id}"/>
                                </td>
                                <td class="tdBtn"><button data-bs-toggle="modal" data-bs-target="#modalActualizar" class="btn btn-outline-dark btnActualizar">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    </button><input type="hidden" id="id" value="${articulo.id}"/>                                                               
                                </td>
                            </tr>                            
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-grid justify-content-end mx-auto w-75">
                <a class="btn btn-outline-primary btn-sm" role="button" href="" data-bs-toggle="modal" data-bs-target="#modalAgregar">Agregar Articulo <i class="fas fa-plus"></i></a>
            </div>
            <!--Modal Eliminar Articulo-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalEliminar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form:form method="get" action="eliminar">
                            <div class="modal-header">                            
                                <h5 class="modal-title">Eliminar articulo</h5>                            
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                            
                            </div>
                            <div class="modal-body">
                                <p>Desea eliminar permanentemente este articulo?</p>                            
                            </div>
                            <div class="modal-footer">                            
                                <input type="hidden" name="id" id="articuloId"/>                                
                                <input type="submit" class="btn btn-danger" value="Eliminar"></input>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>                                
                            </div>                            
                        </form:form>
                    </div>                
                </div>            
            </div>  
            <!--Modal Agregar Articulo-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalAgregar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form:form action="agregar" method="get" modelAttribute="articulo" cssClass="w-75 mx-auto">
                            <div class="modal-header">                            
                                <h5 class="modal-title">Agregar articulo</h5>                            
                                <button class="btn-close" data-bs-dismiss="modal"></button>                            
                            </div>
                            <div class="modal-body">
                                <%@include file="agregarArticulo.jsp" %>
                            </div>
                            <div class="modal-footer">                            
                                <input type="submit" class="btn btn-primary" value="Agregar"></input>
                                <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>                            
                            </div>
                        </form:form>
                    </div>                
                </div>            
            </div> 
            <!--Modal Actualizar Articulo-->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" id="modalActualizar">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="actualizar" method="get" id="formActualizar" cssClass="w-75 mx-auto">
                            <div class="modal-header">                            
                                <h5 class="modal-title">Actualizar articulo</h5>                            
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>                            
                            </div>
                            <div class="modal-body">                                
                                <%@include file="actualizarArticulo.jsp" %>
                            </div>
                            <div class="modal-footer">                            
                                <input type="submit" class="btn btn-success" value="Actualizar"></a>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>                            
                            </div> 
                        </form>
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
            <script src="/js/articulos.js"></script>
    </body>        
</html>