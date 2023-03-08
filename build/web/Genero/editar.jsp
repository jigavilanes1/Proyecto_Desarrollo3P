<%@page import="model.GeneroModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="CSS/stylelog.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Editar Genero</title>
    </head>
    <body>  
        <div class="overlay">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1"> 
                            <%
                                GeneroModel genero = (GeneroModel) request.getAttribute("genero");
                            %>
                            <form action="GeneroController" method="POST">
                                <div class="con">
                                    <div class="form-outline mb-4">
                                        <header class="head-form">
                                            <h2>Genero</h2>        
                                            <p>Ingrese los datos</p>                    
                                        </header>
                                        <div id="res"></div>
                                        <input type="hidden" name="id" value="<%=genero.getId()%>">
                                        <label class="form-label" for="nombre">Nombre:</label>
                                        <br>
                                        <span class="input-item">
                                            <i class="fa fa-user-circle"></i>
                                        </span>
                                        <input type="text" name="nombre" id="nombre" class="form-input" value="<%=genero.getNombre()%>" required>
                                    </div>
                                    <div class="text-center text-lg-start mt-4 pt-2 ">
                                        <button type="submit" class="log-in" name="accion" value="Actualizar">Actualizar Genero</button>
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