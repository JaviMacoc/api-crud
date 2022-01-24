<%@page import="com.bavseal.model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="agregarArticulo.css">    
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
    <main>        
        <a href="actualizarArticulo.jsp">Actualizar Articulox</a>
        <a href="otraJsp.jsp">Otra JSP</a>
        <a href="index.jsp">INDEX</a>
        <form class="needs-validation" novalidate="" action="agregar" method="post">
            <div class="row g-3">
                <div class="col-2">
                    <label class="form-label">ID</label>
                    <input type="number" class="form-control" id="id" name="id" required="">
                    <div class="invalid-feedback">
                        Valid first name is required.
                    </div>
                </div>

                <div class="col-4">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required="">
                    <div class="invalid-feedback">
                        Valid last name is required.
                    </div>
                </div>
                <div class="col-2">
                    <label for="envase" class="form-label">Envase</label>
                    <select class="form-select" id="envase" name="envase" required="">
                        <option value="">Elija...</option>
                        <option>1</option>
                        <option>5</option>
                        <option>10</option>
                    </select>
                    <div class="invalid-feedback">
                        Elija el envasado del producto.
                    </div>
                </div>
                <div class="col-2">
                    <label for="cantidad" class="form-label">Cantidad</label>
                    <div class="input-group has-validation">
                        <input type="number" class="form-control" id="cantidad" name="cantidad" required="">
                        <div class="invalid-feedback">
                            Inserte una cantidad.
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <label for="tipoDeArticulo" class="form-label">Tipo de articulo</label>
                    <select class="form-select" id="tipoDeArticulo" name="tipoDeArticulo" required="">
                        <option value="">Elija...</option>
                        <option>Frutos Secos</option>
                        <option>Frutas Desecadas</option>
                        <option>Semillas</option>
                    </select>
                    <div class="invalid-feedback">
                        Elija la categoría del artículo.
                    </div>
                </div>
                <div class="col-3">
                    <label for="costo" class="form-label">Costo</label>
                    <input type="number" class="form-control" id="costo" name="costo">
                    <div class="invalid-feedback">
                        Ingrese el valor del costo del artículo.
                    </div>
                </div>

                <div class="col-2">
                    <label for="margen" class="form-label">Margen<span class="text-muted">(Optional)</span></label>
                    <%! int margen = 10;%>
                    <input type="number" class="form-control" id="margen" name="margen" value=<%=margen%>>
                </div>

                <div class="col-3">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" class="form-control" id="precio" name="precio" value=<%=(margen * 10)%>>
                </div>
                <hr class="my-4">
                <button class="w-100 btn btn-primary btn-lg" type="submit">Agregar</button>
        </form>
        <table>
            <th>Id</th>
            <th>Nombre</th>
            <th>Envase</th>
            <th>Stock</th>
            <th>Tipo de articulo</th>
            <th>Costo</th>
            <th>Margen</th>
            <th>Precio</th>
        </table>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>