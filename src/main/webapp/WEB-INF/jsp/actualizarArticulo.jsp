<%@page import="com.bavseal.model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!--CSS Propio-->
        <link href="index.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="../html/header.html"%>        
        <a href="agregarArticulo.jsp">Agregar Articulo</a>
        <a href="otraArticulos" formaction="">Otra JSP</a>
        <a href="index.jsp">INDEX</a>        
        <h1>ANDUVO EL GET MAPPING!</h1>
        <div class="container">
            <div class="table-responsive w-75 mx-auto">
                <table class="table table-striped table-hover table-borderless table-sm">
                    <thead style="border-bottom: 2px solid #000">
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Envase</th>
                            <th>Stock</th>
                            <th>Tipo de articulo</th>
                            <th>Costo</th>
                            <th>Margen</th>
                            <th>Precio</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${articulos}" var="articulo">                    
                            <tr>
                                <td><c:out value="${articulo.id}"></c:out></td>
                                <td><c:out value="${articulo.nombre}"></c:out></td>
                                <td><c:out value="${articulo.envase}"></c:out></td>
                                <td><c:out value="${articulo.stock}"></c:out></td>
                                <td><c:out value="${articulo.tipoDeArticulo}"></c:out></td>
                                <td><c:out value="${articulo.costo}"></c:out></td>
                                <td><c:out value="${articulo.margen}"></c:out></td>
                                <td><c:out value="${articulo.precio}"></c:out></td>
                                <td><span><i class="fas fa-trash-alt"></i></span></td>
                                <td><span><i class="fas fa-edit"></i></span></td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table> 
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>

</html>