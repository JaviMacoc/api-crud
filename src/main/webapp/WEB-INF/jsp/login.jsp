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
        <link rel="stylesheet" href="/css/login.css"/>
    </head>
    <body>        
        <div class="container my-5">
            <a class="btn btn-primary" href="/">Inicio</a>            
            <div class="card overflow-hidden border-0 my-5">
                <div class="card-body  p-0">
                    <div class="row">                        
                        <div class="col-10 col-sm-8 col-lg-6 p-2">
                            <div class="container">
                                <div class="text-center">
                                    <h6 class="card-title"><strong>Crea un usuario</strong></h6>
                                </div>
                                <hr>
                                <form:form action="login" method="post" class="form">                                    
                                    <label for="email" class="form-label">Email</label>
                                    <input name="email" type="email" class="form-control"/>
                                    <label for="pass" class="form-label">Contraseña</label>
                                    <input name="pass" type="password" class="form-control"/>                                    
                                    <hr>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                    <br>
                                    <div class="text-center my-2">
                                        <a class="small" href="">Olvidaste tu contraseña?</a>
                                    </div>
                                    <div class="text-center my-2">
                                        <a class="small" href="registroForm">No tienes una cuenta? Regístrate!</a>
                                    </div>
                                </form:form>
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
