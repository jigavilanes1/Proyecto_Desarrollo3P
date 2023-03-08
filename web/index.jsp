<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="CSS/stylelog.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Log In</title>
    </head>
    <body>
    <div class="overlay">
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="LoginController" method="POST"> 
                        <div class="con">
                        <div class="form-outline mb-4">
                            <header class="head-form">
                                <h2>Log In</h2>
                                <p>Ingrese con su usuario y contraseña</p>
                            </header>
                            <label class="form-label" for="usuario">Usuario</label>
                            <br>
                            <span class="input-item">
                                <i class="fa fa-user-circle"></i>
                            </span>
                            <input type="text" name="usuario" id="usuario" class="form-input" placeholder="Ingrese el usuario" />
                        </div>
                        <div class="form-outline mb-3">
                            <label class="form-label" for="password">Password</label>
                            <br>
                            <span class="input-item">
                                <i class="fa fa-key"></i>
                            </span>
                            <input type="password" name="clave" id="clave" class="form-input" placeholder="Ingrese la contraseña" />
                        </div>
                        <div class="text-center text-lg-start mt-4 pt-2 ">
                            <button type="submit" class="log-in"  name="accion" value="Ingresar">Ingresar</button>
                        </div>
                        <form action="LoginController" method="POST">
                            <div class="other">
                                <button class="btn submits frgt-pass" type="submit" name="accion" value="Registrarse">Necesita Registrarse -></button>
                                <button class="btn submits sign-up" type="submit" name="accion" value="Registrarse">Registrarse
                                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                        </form>  
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section> 
    </div>
   
        
        
        
        
        
         
            
                    

        
    </body>
</html>