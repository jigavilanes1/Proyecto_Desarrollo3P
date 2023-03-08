<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Categorias</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Oswald:wght@600&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="../CSS/animate.min.css" rel="stylesheet">
        <link href="../CSS/owl.carousel.min.css" rel="stylesheet">
        <link href="../CSS/bootstrap.min.css" rel="stylesheet">
        <link href="../CSS/style.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-secondary navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a  href="../PeliculasController?accion=Cartelera" class="navbar-brand ms-4 ms-lg-0">
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
                    <a class="nav-item nav-link" href="../PeliculasController?accion=Cartelera">Inicio</a>
                    <a class="nav-item nav-link" href="informacion.jsp">Informacion</a>
                    <a class="nav-item nav-link" href="../ComprasController?accion=Historial&id=<%=id%>">Historial Compras</a>
                    <a class="nav-item nav-link active" href="#">Categorias</a>
                </div>
                <a onclick="location.href='../LoginController?accion=Cerrar Sesion'" class="btn btn-primary rounded-0 py-2 px-lg-4 d-none d-lg-block">Cerrar Sesion<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>
        <!-- Price Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Los mejores estrenos</p>
                        <h1 class="text-uppercase mb-4">Accion</h1>
                        <div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">El cine de acción es un género que combina escenas de violencia, persecuciones, explosiones y luchas con una trama dinámica y emocionante.</h6>
                            </div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">En sus inicios no era muy aceptado y las características relacionadas a la acción como los disparos, las explosiones y las persecuciones se consideraban una serie de elementos que se le agregaban a una historia sólo para hacerla más entretenida.</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="https://i.blogs.es/66f5f1/black-adam/1366_2000.jpeg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="https://cines.com/files/2018/11/estrenos-terror-2019.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Los mejores estrenos</p>
                        <h1 class="text-uppercase mb-4">Terror</h1>
                        <div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">El cine de terror es un género cinematográfico que se caracteriza por su voluntad de provocar en el espectador sensaciones de pavor, terror, miedo, disgusto, repugnancia, horror, incomodidad o preocupación. Sus argumentos frecuentemente desarrollan la súbita intrusión en un ámbito de alguna fuerza, evento o personaje de naturaleza maligna o celestial, a menudo de origen criminal o sobrenatural.</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Los mejores estrenos</p>
                        <h1 class="text-uppercase mb-4">Drama</h1>
                        <div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">El género dramático es una obra de ficción inicialmente representada ante espectadores, en la que interactúan personajes y se desarrolla una historia o suceso utilizando diálogos, narraciones, actuaciones y con el uso de otros recursos escénicos (luces, música, escenografía, etc.).</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="https://www.noraemagazine.com/wp-content/uploads/2019/08/estrenos-kdramas-agosto-2019-1024x548.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="https://www.elseptimoarte.net/imagenes/noticias/650/105005.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Los mejores estrenos</p>
                        <h1 class="text-uppercase mb-4">Comedia</h1>
                        <div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">La comedia es un género dramático, en el sentido de que se trata de un género literario o artístico que presenta distintos episodios de la vida mediante el diálogo de los personajes.</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Los mejores estrenos</p>
                        <h1 class="text-uppercase mb-4">Romance</h1>
                        <div>
                            <div class="d-flex justify-content-bottom py-2">
                                <h6 class="text-uppercase mb-0">El cine romántico es un género cinematográfico que se caracteriza por retratar argumentos construidos de eventos y personajes relacionados con la expresión del amor y las relaciones románticas. El cine romántico se centra en la representación de una historia amorosa de dos o más participantes.</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="https://www.somosmamas.com.ar/wp-content/uploads/2019/10/peliculas-en-espa%C3%B1ol.jpg" alt="">
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
                    <h4 class="text-uppercase mb-4"><img src="../Img/logo.png" alt="Image"></h4>
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
    
    <!-- Footer End -->
    <a href="#" class="btn btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
