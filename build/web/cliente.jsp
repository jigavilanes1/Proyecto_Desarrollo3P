<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cine</title>
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
            <a  href="PeliculasController?accion=Cartelera" class="navbar-brand ms-4 ms-lg-0">
                <h1 class="mb-0 text-primary text-uppercase"><i class="fa fa-laptop me-3"></i>Cinema</h1>
            </a>
            <a class="navbar-brand" class="nav-item nav-link active"> Usuario:
                <%
                    HttpSession sesion = request.getSession();
                    String nombre = (String) sesion.getAttribute("nombre");
                    Integer id = (Integer) sesion.getAttribute("id");
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
                    <a class="nav-item nav-link active" href="#">Inicio</a>
                    <a class="nav-item nav-link" href="Cliente/informacion.jsp">Informacion</a>
                    <a class="nav-item nav-link" href="ComprasController?accion=Historial&id=<%=id%>">Historial Compras</a>
                    <a class="nav-item nav-link" href="Cliente/categorias.jsp">Categorias</a>
                </div>
                <a onclick="location.href = 'LoginController?accion=Cerrar Sesion'" class="btn btn-primary rounded-0 py-2 px-lg-4 d-none d-lg-block">Cerrar Sesion<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>
        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <video src="Img/video.mp4" width="100%" autoplay muted loop></video>
                    <div class="carousel-caption d-flex align-items-center justify-content-center text-start">
                        <div class="mx-sm-5 px-5" style="max-width: 900px;">
                            <h1 class="display-2 text-white text-uppercase mb-4 animated slideInDown">PROXIMAMENTE</h1>
                            <h4 class="text-white text-uppercase mb-4 animated slideInDown"><i class="fa fa-play text-primary me-3"></i>Solo en Cines</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="text-uppercase">Peliculas en Cartelera</h1>
                </div>
                <div class="row g-4" id="cartelera">
                    <c:forEach var="oPelicula" items="${peliculas}">
                        <div class='col-lg-3 col-md-6 wow fadeInUp' data-wow-delay='0.1s'>
                            <div class='team-item'>
                                <div class='team-img position-relative overflow-hidden'>
                                    <img class='img-fluid' src='<c:out value="${oPelicula.foto}"/>' alt=''>
                                    <div class='team-social'>
                                        <a class='btn btn-square' href='ComprasController?accion=Comprar&id=<%=id%>&idP=<c:out value="${oPelicula.id}"/>'><c:out value="${oPelicula.nombre}"/></a>
                                    </div>
                                </div>
                                <div class='bg-secondary text-center p-4'>
                                    <a href='ComprasController?accion=Comprar&id=<%=id%>&idP=<c:out value="${oPelicula.id}"/>'>
                                        <h5 class='text-uppercase'>Comprar</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>                    
                </div>
                <br>
            </div>
        </div>
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="Img/car1.png" alt="Image">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="Img/car2.png" alt="Image">
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="Img/car3.png" alt="Image">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <img class="w-100" src="Img/ter.png" alt="Image">
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
                        <a class="btn btn-link" href="Cliente/informacion.jsp">Informacion</a>
                        <a class="btn btn-link" href="Cliente/categorias.jsp">Categorias</a>
                        <a class="btn btn-link" href="ComprasController?accion=Historial&id=<%=id%>">Historial</a>
                        <a class="btn btn-link" href="Cliente/informacion.jsp">Informacion</a>
                        <a class="btn btn-link" href="Cliente/categorias.jsp">Categorias</a>
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
        <a href="#" class="btn btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>