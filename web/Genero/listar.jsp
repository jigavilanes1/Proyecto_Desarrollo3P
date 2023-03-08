<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genero</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body class="mx-auto" style="width: 1250px; background-image: url('https://images3.alphacoders.com/702/70225.jpg')">  
        <h2 class="text-center" style="color: #ffffff">♦----------------------♦</h2>
        <h1 class="text-center" style="color: #ffffff">Genero</h1>
        <h2 class="text-center" style="color: #ffffff">♦----------------------♦</h2>        
        <div class="text-center">
            <button class="btn btn-success" onclick="location.href='GeneroController?accion=Nuevo'">Nuevo</button>
            <button class="btn btn-danger" onclick="location.href='UsuariosController?accion=Administrador'">Regresar</button>
        </div>        
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach var="oGenero" items="${generos}">
                <tr class="table-light">
                    <td><c:out value="${oGenero.id}"/></td>
                    <td><c:out value="${oGenero.nombre}"/></td>
                    <td>
                        <form action="GeneroController">
                            <input type="hidden" name="id" value="<c:out value="${oGenero.id}"/>">
                            <input class="btn btn-info" type="submit" name="accion" value="Editar">
                        </form>
                    </td>
                    <td>
                        <form action="GeneroController">
                            <input type="hidden" name="id" value="<c:out value="${oGenero.id}"/>">
                            <input class="btn btn-danger" type="submit" name="accion" value="Eliminar">
                        </form>
                    </td>                
                </tr>
                <br>
            </c:forEach>  
        </table>
    </body>
</html>