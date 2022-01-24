<%@page import="com.bavseal.model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html onload="${articuloController.consularArticulos()}">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
        <link rel="stylesheet" href="actualizarArticulo.css">
        <title>API CRUD TITULO</title>
    </head>

    <body>
        <header class="p-3 mb-3 border-bottom">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                        <use xlink:href="#bootstrap" /></svg>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="#" class="nav-link px-2 link-dark">Articulos</a></li>
                        <li><a href="#" class="nav-link px-2 link-dark">Clientes</a></li>
                    </ul>

                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                        <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                    </form>

                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="#">New project...</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <a href="agregarArticulo.jsp">Argegar Articulox</a>    
        <a href="otraJsp.jsp">Otra JSP</a>
        <a href="index.jsp">INDEX</a>
        <h1>ANDUVO EL GET MAPPING!</h1>
        <div>
            <form action="">
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>

</html>