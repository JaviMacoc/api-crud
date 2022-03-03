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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
        <!--CSS Propio-->
        <spring:url var="cssExt" value="/css/index.css"/>
        <link href="${cssExt}" rel="stylesheet" type="text/css"/> 
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="d-grid gap-2 col-6 mx-auto my-2">
                <a href="registroForm" class="btn btn-outline-primary">Registrar Usuario</a>
            </div>
            <div class="d-grid gap-2 col-6 mx-auto my-2">
                <a href="loginForm" class="btn btn-outline-primary">Login</a>
            </div>
            <div class="d-grid gap-2 col-6 mx-auto">
                <c:forEach items="${mensaje}" var="mensajes">
                    <div class="alert alert-danger m-2">
                        <i class="fa-solid fa-circle-exclamation"></i><span class="mx-2"><c:out value="${mensajes}"></c:out></span>
                    </div>
                </c:forEach>               
            </div>            
        </div>
        <div class="container">
            <c:if test="${session.usuario != null}">
                <c:out value="${session.usuario != null}"><h4>Bienvenido <c:out value="${session.usuario}" /></h4></c:out>
            </c:if>
        </div>            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>
</html>