<%@page import="model.UsuariosModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="CSS/stylelog.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Editar Usuario</title>
    </head>
    <body> 
        <div class="overlay">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <%
                                UsuariosModel usuario = (UsuariosModel) request.getAttribute("usuario");
                            %>
                            <form action="UsuariosController" method="POST">
                                <div class="con">
                                    <div class="form-outline mb-4">
                                        <header class="head-form">
                                            <h2>Usuarios</h2>        
                                            <p>Ingrese sus datos</p>                    
                                        </header>
                                        <div id="res"></div>
                                        <input type="hidden" name="id" value="<%=usuario.getId()%>">
                                        <label class="form-label" for="nombre">Nombre:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" name="nombre" id="nombre" class="form-input" value="<%=usuario.getNombre()%>" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="correo">Correo:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="email" name="email" id="email" class="form-input" value="<%=usuario.getEmail()%>" required>
                                    </div>       
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="cedula">Cedula:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input minlength="10" maxlength="10" name="cedula" type="text" id="cedula" class="form-input" value="<%=usuario.getCedula()%>" required>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="genero">Genero:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <select id="genero" name="genero" class="form-select" required>
                                            <option value="<%=usuario.getGenero()%>" selected><%=usuario.getGenero()%></option>
                                            <option value="Masculino">Masculino</option>
                                            <option value="Femenino">Femenino</option>
                                            <option value="Otros">Otros</option>
                                        </select>
                                        <input type="hidden" name="tipo" value="<%=usuario.getTipo()%>">
                                    </div>
                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="usuario">Usuario:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" id="usuario" name="usuario" class="form-input" value="<%=usuario.getUser()%>" required>
                                    </div>
                                    <div class="text-center text-lg-start mt-4 pt-2 ">
                                        <button type="submit" class="log-in" name="accion" value="Actualizar">Actualizar Usuarios</button>
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

