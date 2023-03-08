<%@page import="model.UsuariosModel"%>
<%@page import="model.ComprasModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuariosDAO"%>
<%@page import="dao.ComprasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3">Panel de Control</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
                <i class="fas fa-bars"></i>
            </button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-0 my-2 my-md-0">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Notificaciones</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li>
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Ventas nuevas</h6>
                                <small>Hace 15 minutos</small>
                            </a>
                        </li>
                        <hr class="dropdown-divider" />
                        <li>
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Actualizar Cartelera</h6>
                                <small>Hace 1 hora</small>
                            </a>
                        </li>
                        <hr class="dropdown-divider" />
                        <li>
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Nuevas Peliculas</h6>
                                <small>Hace 2 hora</small>
                            </a>
                        </li>
                    </ul>
                </div>
            </form>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="Img/adlogo.png" alt="" style="width: 40px; height: 40px" />
                        <span class="d-none d-lg-inline-flex">Administrador</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Configuraciones</a></li>
                        <li><a class="dropdown-item" href="#!">Actividad</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" onclick="location.href = 'LoginController?accion=Cerrar Sesion'">Salir</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="d-flex align-items-center ms-4 mb-4">
                                <div class="position-relative">
                                    <img class="rounded-circle" src="Img/adlogo.png" alt="" style="width: 40px; height: 40px" />
                                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                                </div>
                                <div class="ms-3">
                                    <h6 class="mb-0">
                                        <%
                                            HttpSession sesion = request.getSession();
                                            String nombre = (String) sesion.getAttribute("nombre");
                                            Integer tipo = (Integer) sesion.getAttribute("tipo");
                                            out.println(nombre);
                                            if (nombre == null) {
                                                response.sendRedirect("index.jsp");
                                            }
                                            if (tipo == 2) {
                                                response.sendRedirect("PeliculasController?accion=Cartelera");
                                            }
                                        %>
                                    </h6>
                                    <span>Activo</span>
                                </div>
                            </div>
                            <div class="sb-sidenav-menu-heading">Inicio</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-tachometer-alt"></i>
                                </div>General
                            </a>
                            <div class="sb-sidenav-menu-heading">Estadisticas</div>
                            <a class="nav-link" href="#datos">
                                <div class="sb-nav-link-icon"><i class="fas fa-tv"></i></div> Datos
                            </a>            
                            <a class="nav-link" href="#personas">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div> Clientes
                            </a>
                            <a class="nav-link" href="#admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div> Administradores
                            </a>
                            <a class="nav-link" href="#compras">
                                <div class="sb-nav-link-icon"><i class="fas fa-usd"></i></div> Compras
                            </a>
                            <div class="sb-sidenav-menu-heading">Administracion</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Edicion
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href='UsuariosController?accion=Usuarios'">
                                        <div class="sb-nav-link-icon"><i class="fas fa-street-view"></i></div> Usuario
                                    </a>
                                    <a class="nav-link" href='UsuariosController?accion=Clientes'">
                                        <div class="sb-nav-link-icon"><i class="fas fa-house"></i></div> Clientes
                                    </a>
                                    <a class="nav-link" href='PeliculasController?accion=Peliculas'">
                                        <div class="sb-nav-link-icon"><i class="fas fa-film"></i></div> Películas
                                    </a>
                                    <a class="nav-link" href='GeneroController?accion=Genero'">
                                        <div class="sb-nav-link-icon"><i class="fas fa-film"></i></div> Genero
                                    </a>
                                </nav>
                            </div>
                        </div>
                        <div class="sb-sidenav-menu-heading"></div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Proyecto Desarrollo Web</div>
                            Tercer Parcial
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Pagina Principal</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Tipos de targetas</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Targetas Admitidas</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        Tarjetas de Debito
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Tarjetas Advertidas</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        Tarjetas de Credito
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Tarjetas Preferidas</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        Pichincha y Guayaquil
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Tarjetas Rechazadas</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        Tarjetas Otros Cines
                                    </div>
                                </div>
                            </div>
                        </div>
                        <section id="datos">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Estadisticas de Ventas</li>
                            </ol>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-area me-1"></i>
                                            Ventas Diarias Semana 3 y 4
                                        </div>
                                        <div class="card-body">
                                            <canvas id="myAreaChart" width="100%" height="40"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-bar me-1"></i>
                                            Ventas Mensuales Mes Febrero
                                        </div>
                                        <div class="card-body">
                                            <canvas id="myBarChart" width="100%" height="40"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <%
                            UsuariosDAO uDAO = new UsuariosDAO();
                            ComprasDAO cDAO = new ComprasDAO();
                            ArrayList<UsuariosModel> usuarios = new ArrayList<UsuariosModel>();
                            ArrayList<UsuariosModel> clientes = new ArrayList<UsuariosModel>();
                            ArrayList<ComprasModel> compras = new ArrayList<ComprasModel>();
                            usuarios = uDAO.BuscarTodos(1);
                            clientes = uDAO.BuscarTodos(2);
                            compras = cDAO.BuscarTodos();
                        %>
                        <section id="personas">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Tabla de Clientes</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Clientes Febrero
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table">
                                                <thead class="table-dark">
                                                    <tr align='center'>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">CEDULA</th>
                                                        <th scope="col">NOMBRE</th>
                                                        <th scope="col">USUARIO</th>
                                                        <th scope="col">EMAIL</th>
                                                        <th scope="col">GENERO</th>
                                                    </tr>
                                                </thead> 
                                                <c:forEach var="oCliente" items="<%=clientes%>">
                                                    <tr>
                                                        <td><c:out value="${oCliente.id}"/></td>
                                                        <td><c:out value="${oCliente.cedula}"/></td>
                                                        <td><c:out value="${oCliente.nombre}"/></td>
                                                        <td><c:out value="${oCliente.user}"/></td>
                                                        <td><c:out value="${oCliente.email}"/></td>
                                                        <td><c:out value="${oCliente.genero}"/></td>                    
                                                    </tr>                                                    
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section id="admin">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Tabla de Administradores</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Administradores Febrero
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table">
                                                <thead class="table-dark">
                                                    <tr align='center'>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">CEDULA</th>
                                                        <th scope="col">NOMBRE</th>
                                                        <th scope="col">USUARIO</th>
                                                        <th scope="col">EMAIL</th>
                                                        <th scope="col">GENERO</th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="oUsuario" items="<%=usuarios%>">
                                                    <tr>
                                                        <td><c:out value="${oUsuario.id}"/></td>
                                                        <td><c:out value="${oUsuario.cedula}"/></td>
                                                        <td><c:out value="${oUsuario.nombre}"/></td>
                                                        <td><c:out value="${oUsuario.user}"/></td>
                                                        <td><c:out value="${oUsuario.email}"/></td>
                                                        <td><c:out value="${oUsuario.genero}"/></td>                    
                                                    </tr>                                                    
                                                </c:forEach>  
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>                                     
                        <section id="compras">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Tabla de Compras</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Compras Febrero
                                </div>
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
                                                <c:forEach var="oCompra" items="<%=compras%>">
                                                    <tr>
                                                        <td><c:out value="${oCompra.id}"/></td>
                                                        <td><c:out value="${oCompra.usuario}"/></td>
                                                        <td><c:out value="${oCompra.pelicula}"/></td>
                                                        <td><c:out value="${oCompra.sala}"/></td>
                                                        <td><c:out value="${oCompra.cantidad}"/></td>
                                                        <td><c:out value="${oCompra.total}"/></td>
                                                    </tr>                                                    
                                                </c:forEach>  
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">
                                Copyright &copy; Gavilanes Jaramillo Zambrano 2022
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="JS/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="JS/chart-area-demo.js"></script>
        <script src="JS/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>



