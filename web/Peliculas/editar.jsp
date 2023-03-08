<%@page import="dao.GeneroDAO"%>
<%@page import="model.PeliculasModel"%>
<%@page import="model.GeneroModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="CSS/stylelog.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Editar Pelicula</title>
    </head>
    <body> 
        <div class="overlay">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1"> 
                            <%
                                PeliculasModel pelicula = (PeliculasModel) request.getAttribute("pelicula");
                                GeneroDAO gDAO = new GeneroDAO();
                                GeneroModel genero = new GeneroModel();
                                genero = gDAO.BuscarPorId(pelicula.getIdGenero());
                            %>
                            <form action="PeliculasController" method="POST">
                                <div class="con">
                                    <div class="form-outline mb-4">
                                        <header class="head-form">
                                            <h2>Peliculas</h2>        
                                            <p>Ingrese los datos</p>                    
                                        </header>
                                        <div id="res"></div>
                                        <input type="hidden" name="id" id="id" value="<%=pelicula.getId()%>">
                                        <label class="form-label" for="nombre">Nombre:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" name="nombre" id="nombre" class="form-input" value="<%=pelicula.getNombre()%>" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="genero">Genero:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <select class="form-control" name="idGenero" value="Seleccione" required>
                                            <option value="<%=pelicula.getIdGenero()%>" selected><%=genero.getNombre()%></option>                                            
                                            <c:forEach var="oGenero" items="${generos}">
                                                <c:if test="${oGenero.id != pelicula.idGenero}">
                                                    <option value="<c:out value="${oGenero.id}"/>"><c:out value="${oGenero.nombre}"/></option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="duracion">Duracion:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="number" id="duracion" name="duracion" class="form-input" value="<%=pelicula.getDuracion()%>" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="sinopsis">Sinopsis:</label>
                                        <br>
                                        <textarea name="sinopsis" rows="8" cols="35" class="form-control" autocomplete="off" required><%=pelicula.getSinopsis()%></textarea>                           
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="foto">Foto:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" id="foto" name="foto" class="form-input" value="<%=pelicula.getFoto()%>" required>
                                    </div>
                                    <div class="text-center text-lg-start mt-4 pt-2 ">
                                        <button class="log-in" type="submit" name="accion" value="Actualizar">Actualizar Pelicula</button>
                                    </div> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>