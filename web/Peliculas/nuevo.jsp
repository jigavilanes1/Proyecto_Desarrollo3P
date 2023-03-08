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
        <title>Nueva Pelicula</title>
    </head>
    <body>  
        <div class="overlay">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1"> 
                            <form action="PeliculasController" method="POST">
                                <div class="con">
                                    <div class="form-outline mb-4">
                                        <header class="head-form">
                                            <h2>Peliculas</h2>        
                                            <p>Ingrese los datos</p>                    
                                        </header>
                                        <div id="res"></div>
                                        <input type="hidden" name="id" id="id">
                                        <label class="form-label" for="nombre">Nombre:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" name="nombre" id="nombre" class="form-input" placeholder="Ingrese nombre de la pelicula" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="genero">Genero:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <select class="form-control" name="idGenero" value="Seleccione" required>
                                            <c:forEach var="oGenero" items="${generos}">
                                                <option value="<c:out value="${oGenero.id}"/>"><c:out value="${oGenero.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="duracion">Duracion:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="number" id="duracion" name="duracion" class="form-input" placeholder="Ingrese la duracion de la pelicula." required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="sinopsis">Sinopsis:</label>
                                        <br>
                                        <textarea name="sinopsis" rows="8" cols="35" placeholder="Escriba aqui" class="form-control" autocomplete="off" required></textarea>   
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="foto">Foto:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" id="foto" name="foto" class="form-input" placeholder="Ingrese el link de la foto." required>
                                    </div>
                                    <div class="text-center text-lg-start mt-4 pt-2 ">
                                        <button type="submit" class="log-in" name="accion" value="Guardar">Guardar Pelicula</button>
                                    </div>     
                                    <div class="other">
                                        <button class="btn submits frgt-pass" onclick="location.href = 'PeliculasController?accion=Peliculas'"><-Regresar</button>                  

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
