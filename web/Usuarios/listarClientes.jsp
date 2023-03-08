<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>    
    <body class="mx-auto" style="width: 1250px; background-image: url('https://images3.alphacoders.com/702/70225.jpg')">  
        <h2 class="text-center" style="color: #ffffff">♦----------------------♦</h2>
        <h1 class="text-center" style="color: #ffffff">Clientes</h1>
        <h2 class="text-center" style="color: #ffffff">♦----------------------♦</h2>
        <div class="text-center">            
            <button class="btn btn-danger" onclick="location.href='UsuariosController?accion=Administrador'">Regresar</button>
        </div>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Usuario</th>
                    <th>Cédula</th>
                    <th>Email</th>
                    <th>Genero</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach var="oCliente" items="${clientes}">
                <tr class="table-light">
                    <td><c:out value="${oCliente.id}"/></td>
                    <td><c:out value="${oCliente.nombre}"/></td>
                    <td><c:out value="${oCliente.user}"/></td>
                    <td><c:out value="${oCliente.cedula}"/></td>
                    <td><c:out value="${oCliente.email}"/></td>
                    <td><c:out value="${oCliente.genero}"/></td>                    
                    <td>
                        <form action="UsuariosController">
                            <input type="hidden" name="id" value="<c:out value="${oCliente.id}"/>">
                            <input class="btn btn-info" type="submit" name="accion" value="Editar">
                        </form>
                    </td>
                    <td>
                        <form action="UsuariosController">
                            <input type="hidden" name="id" value="<c:out value="${oCliente.id}"/>">
                            <input class="btn btn-danger" type="submit" name="accion" value="Eliminar">
                        </form>
                    </td>
                </tr>
                <br>
            </c:forEach>  
        </table>
    </body>
</html>