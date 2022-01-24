<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="otraJsp.css">
    <title>OTRA</title>
</head>

<body>
    <a href="agregarArticulo.jsp">Argegar Articulox</a>
    <a href="actualizarArticulo.jsp">Actualizar Articulox</a>    
    <a href="index.jsp">INDEX</a>
    <h1>ANDUVO EL GET MAPPING!</h1>
    <div>
        <form action="clq">
            <table>
                <th>Id</th>
                <th>Nombre</th>
                <th>Envase</th>
                <th>Stock</th>
                <th>Tipo de articulo</th>
                <th>Costo</th>
                <th>Margen</th>
                <th>Precio</th>
                <c:forEach items="${lista}" var="articulo">
                    <tr>
                        <td>
                            <c:out value="${articulo.id}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.nombre}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.envase}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.stock}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.tipoDeArticulo}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.costo}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.margen}"></c:out>
                        </td>
                        <td>
                            <c:out value="${articulo.precio}"></c:out>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
</body>

</html>