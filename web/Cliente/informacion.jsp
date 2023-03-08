<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Información</title>
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
                        response.sendRedirect("../index.jsp");
                    }
                %>           
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a class="nav-item nav-link" href="../PeliculasController?accion=Cartelera">Inicio</a>
                    <a class="nav-item nav-link active" href="#">Informacion</a>
                    <a class="nav-item nav-link" href="../ComprasController?accion=Historial&id=<%=id%>">Historial Compras</a>
                    <a class="nav-item nav-link" href="categorias.jsp">Categorias</a>
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
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Para mejorar la experiencia, nuestros combos son excelentes</p>
                        <h1 class="text-uppercase mb-4">Precios de los Combos </h1>
                        <div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO 1</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 1 bebida 32oz + 1 hot dog</h6>
                                <span class="text-uppercase text-primary">$7.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO 2</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 1 bebida 32oz + 1 nacho</h6>
                                <span class="text-uppercase text-primary">$7.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO 3</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 2 bebidas 32oz + 2 snack</h6>
                                <span class="text-uppercase text-primary">$12.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO 4</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 2 bebidas 32oz</h6>
                                <span class="text-uppercase text-primary">$7.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO MEGA</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 1 bebida 32oz + 1 snack mega</h6>
                                <span class="text-uppercase text-primary">$9.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO DINERS</h6>
                                <h6 class="text-uppercase mb-0">11 bucket con canguil + 2 bebidas 32oz  + 4 dulces</h6>
                                <span class="text-uppercase text-primary">$13.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO FANTA FLOAT</h6>
                                <h6 class="text-uppercase mb-0">1 canguil mediano + 1 fanta float 12oz + 1 hot dog</h6>
                                <span class="text-uppercase text-primary">$7.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO BLACK ADAM</h6>
                                <h6 class="text-uppercase mb-0">1 bucket con canguil + 1 bebida 32oz + 1 hot dog</h6>
                                <span class="text-uppercase text-primary">$15.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO BLACK PANTHER</h6>
                                <h6 class="text-uppercase mb-0">1 bucket con canguil + 2 bebidas 32oz</h6>
                                <span class="text-uppercase text-primary">$15.99</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <h6 class="text-uppercase mb-0">COMBO FUTBOLERO</h6>
                                <h6 class="text-uppercase mb-0">11 bucket con canguil + 1 bebida 32oz + 1 hot dog o nacho</h6>
                                <span class="text-uppercase text-primary">$10.99</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="h-100">
                        <img class="img-fluid h-100" src="../Img/combos.jpg" alt="">
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
                        <img class="img-fluid h-100" src="../Img/entradas.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-secondary h-100 d-flex flex-column justify-content-center p-5">
                        <p class="d-inline-flex bg-dark text-primary py-1 px-4 me-auto">Precios de las entradas y promociones</p>
                        <h1 class="text-uppercase mb-4">Precios</h1>
                        <div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital de Lunes a Miercoles 2D</h6>
                                <span class="text-uppercase text-primary">$5.20</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital de Lunes a Miercoles 2D VIP</h6>
                                <span class="text-uppercase text-primary">$7.90</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital de Lunes a Miercoles 3D</h6>
                                <span class="text-uppercase text-primary">$7.00</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital de Lunes a Miercoles 3D VIP</h6>
                                <span class="text-uppercase text-primary">$9.10</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital Feriados 2D</h6>
                                <span class="text-uppercase text-primary">$6.60</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital Feriados 2D VIP</h6>
                                <span class="text-uppercase text-primary">$13.90</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital Feriados 3D</h6>
                                <span class="text-uppercase text-primary">$8.60</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Digital Feriados 3D VIP</h6>
                                <span class="text-uppercase text-primary">$15.90</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Tercera edad discapacitados 2D</h6>
                                <span class="text-uppercase text-primary">$3.30</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Tercera edad discapacitados 2D VIP</h6>
                                <span class="text-uppercase text-primary">$6.95</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Tercera edad discapacitados 3D</h6>
                                <span class="text-uppercase text-primary">$4.30</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom py-2">
                            <h6 class="text-uppercase mb-0">Tercera edad discapacitados 3D VIP</h6>
                                <span class="text-uppercase text-primary">$7.95</span>
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
