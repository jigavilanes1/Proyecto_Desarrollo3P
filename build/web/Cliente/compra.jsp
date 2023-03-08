<%@page import="model.UsuariosModel"%>
<%@page import="model.PeliculasModel"%>
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
        <script src="JS/operaciones.js"></script>
        <title>Compra</title>
    </head>
    <body>  
        <div class="overlay">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <%
                                UsuariosModel usuario = (UsuariosModel) request.getAttribute("usuario");
                                PeliculasModel pelicula = (PeliculasModel) request.getAttribute("pelicula");
                                HttpSession sesion = request.getSession();
                                String nombre = (String) sesion.getAttribute("nombre");
                                Integer id = (Integer) sesion.getAttribute("id");
                                if (nombre == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                            <form action="ComprasController" method="POST">
                                <div class="con">
                                    <div class="form-outline mb-4">
                                        <header class="head-form">
                                            <h2>Compra</h2>        
                                            <p>Ingrese los datos de su compra</p>                    
                                        </header>
                                        <div id="res"></div>
                                        <input type="hidden" name="usuario" value="<%=usuario.getId()%>">
                                        <input type="hidden" name="pelicula" value="<%=pelicula.getId()%>">
                                        <label class="form-label" for="nombre">Nombre:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" name="nombre" id="nombre" class="form-input" value="<%=usuario.getNombre()%>" disabled>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="correo">Correo:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="email" name="email" id="email" class="form-input" value="<%=usuario.getEmail()%>" disabled>
                                    </div>       
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="cedula">Pelicula:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input name="pelicula" type="text" id="pelicula" class="form-input" value="<%=pelicula.getNombre()%>" disabled>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="sala">Sala:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <select id="sala" name="sala" class="form-select" onchange="CalcularTotal();" required>
                                            <option value="" selected>Seleccione la sala</option>
                                            <option value="2D DOB">2D DOB</option>
                                            <option value="2D ESP">2D ESP</option>
                                            <option value="3D ESP">3D ESP</option>
                                        </select>
                                    </div>                                                                        
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="cantidad">Cantidad:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="number" id="cantidad" name="cantidad" min="0" onchange="CalcularTotal();" class="form-input" value="0" placeholder="Ingrese la cantidad" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="total">Total:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="number" name="total" id="total" class="form-input" value="0" readonly required>
                                    </div>
                                    <div class="text-center text-lg-start mt-4 pt-2 ">
                                        <button type="submit" class="log-in" name="accion" value="Guardar">Guardar Compra</button>
                                    </div>     
                                    <div class="other">
                                        <button class="btn submits frgt-pass" onclick="location.href = 'PeliculasController?accion=Cartelera'"><-Regresar</button>                  
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