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
        <c:url value="/css/index.css" var="cssExt"></c:url>
        <link href="${cssExt}" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--Header importado-->
        <%@include file="../header.jsp"%>
            <!--Formulario Actualizar Cliente-->        
            <div class="container">

            <form:form action="/clientes/actualizar" method="post" modelAttribute="clienteUpdt" cssClass="w-75 mx-auto">
                <div class="my-4 ps-0">
                    <h4>Editar Cliente</h4>
                </div>
                <div class="row g-3">                    
                    <form:hidden path="id"/>                                    
                    <div class="col-12 col-md-6">
                        <form:label path="nombre" cssClass="form-label">Nombre</form:label>
                        <form:input path="nombre" cssClass="form-control" required="true"/>
                        <div class="invalid-feedback">
                            Debe ingresar el nombre del cliente.
                        </div>
                    </div>                    
                    <div class="col-12 col-md-6">
                        <form:label path="apellido" cssClass="form-label">Apellido</form:label>
                            <div class="input-group has-validation">
                            <form:input path="apellido" cssClass="form-control" required=""/>
                            <div class="invalid-feedback">
                                Debe ingresar el apellido del cliente.
                            </div>
                        </div>
                    </div>                   
                    <div class="col-12 col-md-6">
                        <form:label path="email" cssClass="form-label">Email</form:label>
                        <form:input path="email" id="costo" cssClass="form-control" required="true"/>
                        <div class="invalid-feedback">
                            Ingrese un email.
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <form:label path="direccion" cssClass="form-label">Direccion</form:label>
                        <form:input path="direccion" cssClass="form-control" required=""/>                        
                    </div> 
                    <div class="col-12 col-md-6">
                        <form:label path="telefono" cssClass="form-label">Telefono</form:label>
                        <form:input path="telefono" cssClass="form-control" required="true"/>
                        <div class="invalid-feedback">
                            Debe ingresar el telefono del cliente.
                        </div>
                    </div>  
                </div>
                <hr class="my-4">
                <div class="d-flex justify-content-end">
                    <button class="btn btn-success" type="submit">Actualizar</button>
                </div>
            </form:form>
        </div>
        <!--Script BootStrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>
</html>