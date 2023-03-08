<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Historial</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Oswald:wght@600&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="CSS/animate.min.css" rel="stylesheet">
        <link href="CSS/owl.carousel.min.css" rel="stylesheet">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-secondary navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a class="navbar-brand ms-4 ms-lg-0">
                <h1 class="mb-0 text-primary text-uppercase"><i class="fa fa-laptop me-3"></i>Cinema</h1>
            </a>
            <a class="navbar-brand" class="nav-item nav-link active"> Usuario:
                <%
                    HttpSession sesion = request.getSession();
                    String nombre = (String) sesion.getAttribute("nombre");
                    out.println(nombre);
                    if (nombre == null) {
                        response.sendRedirect("index.jsp");
                    }
                %>           
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">                    
                    <a class="nav-item nav-link" href="PeliculasController?accion=Cartelera">Inicio</a>
                    <a class="nav-item nav-link" href="Cliente/informacion.jsp">Informacion</a>
                    <a class="nav-item nav-link active" href="#">Historial Compras</a>
                    <a class="nav-item nav-link" href="Cliente/categorias.jsp">Categorias</a>
                </div>
                <a onclick="location.href = 'LoginController?accion=Cerrar Sesion'" class="btn btn-primary rounded-0 py-2 px-lg-4 d-none d-lg-block">Cerrar Sesion<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>   
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-0">
                    <div class="col-lg-12 wow fadeIn" data-wow-delay="0.1s">
                        <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                            <h1 class="text-uppercase mb-4">Historial de Compras </h1>
                            <div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table">
                                                <thead class="table-dark" align="center">
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">NOMBRE</th>                                                        
                                                        <th scope="col">PELICULA</th>
                                                        <th scope="col">SALA</th>
                                                        <th scope="col">CANTIDAD</th>
                                                        <th scope="col">TOTAL</th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="oHistorial" items="${historial}">
                                                    <tr>
                                                        <td><c:out value="${oHistorial.id}"/></td>                                                        
                                                        <td><c:out value="${oHistorial.usuario}"/></td>
                                                        <td><c:out value="${oHistorial.pelicula}"/></td>
                                                        <td><c:out value="${oHistorial.sala}"/></td>
                                                        <td><c:out value="${oHistorial.cantidad}"/></td>
                                                        <td><c:out value="${oHistorial.total}"/></td>
                                                    </tr>                                                    
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-4 col-md-6">
                        <h4 class="text-uppercase mb-4"><img src="Img/logo.png" alt="Image"></h4>
                        <div class="d-flex align-items-center mb-2">
                            <div class="btn-square bg-dark flex-shrink-0 me-3">
                                <span class="fa fa-map-marker-alt text-primary"></span>
                            </div>
                            <span>Av. Simon Bolivar</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="btn-square bg-dark flex-shrink-0 me-3">
                                <span class="fa fa-envelope-open text-primary"></span>
                            </div>
                            <span>cinemex@info.com</span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <h4 class="text-uppercase mb-4">Sobre Nosotros</h4>
                        <a class="btn btn-link" href="">Informacion</a>
                        <a class="btn btn-link" href="">Peliculas Accion</a>
                        <a class="btn btn-link" href="">Peliculas Terror</a>
                        <a class="btn btn-link" href="">Peliculas Drama</a>
                        <a class="btn btn-link" href="">Peliculas Romance</a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <h4 class="text-uppercase mb-4">Siguenos en nuestras redes</h4>
                        <div class="d-flex pt-1 m-n1">
                            <a class="btn btn-lg-square btn-dark text-primary m-1" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg-square btn-dark text-primary m-1" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg-square btn-dark text-primary m-1" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-lg-square btn-dark text-primary m-1" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        <a href="#" class="btn btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
