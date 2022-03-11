<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CompuMungoHiperMegaRed</title>
        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
        <!--FontAwesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>   
        <link rel="stylesheet" href="/css/registro.css"/>
    </head>
    <body>        
        <c:forEach items="${usuarios}" var="usuario">
            <div class="container d-flex justify-content-end my-4">
                <div class="alert alert-success d-inline ms-auto d-flex">
                    <i class="fa-solid fa-hexagon-check"></i>
                    El usuario <c:out value="${usuario.email}"></c:out> ha sido registrado.
                    <button type=button" class="btn-close mt-0 m-2" data-bs-dismiss="alert"></button>
                </div>                
            </div>
        </c:forEach> 

        <div class="container my-3">
            <a class="btn btn-primary" href="/">Inicio</a>            
            <div class="card overflow-hidden border-0 my-5">
                <div class="card-body  p-0">
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-img-fs">                               
                        </div>
                        <div class="col-lg-7 p-2">
                            <div class="container">
                                <div class="text-center">
                                    <h6 class="card-title"><strong>Crea un usuario</strong></h6>
                                </div>
                                <hr>
                                <form:form modelAttribute="usuarioDto" action="/login" method="POST">                                                                                                            
                                    <form:label path="username" for="username" cssClass="form-label">Email</form:label>
                                    <form:input path="username" name="username" id="username" type="text" cssClass="form-control"/>
                                    <form:errors path="username" cssClass="alert alert-danger my-1 p-2" cssStyle="font-size: .75em" element="div"/>  

                                    <form:label path="password" for="password" cssClass="form-label">Contraseña</form:label>
                                    <form:input path="password" name="password" id="password" type="password" cssClass="form-control"/>
                                    <form:errors path="password" cssClass="alert alert-danger my-1 p-2" cssStyle="font-size: .75em" element="div"/>  
                                    <hr>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                    </form:form>
                                    <br>
                                    <div class="text-center my-2">
                                        <a class="small" href="">Olvidaste tu contraseña?</a>
                                    </div>
                                    <div class="text-center my-2">
                                        <a class="small" href="registroForm">No tienes una cuenta? Regístrate!</a>
                                    </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>        
        <!--Script BootStrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>
</html>