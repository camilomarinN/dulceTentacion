<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LoginPage - Dulce Tentación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<section class="vh-100" style="background-color: #F0DEDE;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0 d-flex">
            <div class="col-xl-6 d-none d-xl-block" style="background-color: #F0DEDE;">
              <img src="img/logo.jpg" alt="login form" class="img-fluid" />
            </div>
            <div class="col-12 col-xl-6 align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
              	<form action="Controlador" method="POST">
                  <h5 class="font-weight-bold mb-3 pb-3" style="letter-spacing: 1px;">Inicia sesión con nosotros!</h5>
                  <div class="form-outline mb-4">
                    <input type="email" id="email" name="email" class="form-control form-control-lg" />
                    <label class="form-label" for="email">Correo Electronico</label>
                  </div>
                  <div class="form-outline mb-4">
                    <input type="password" id="pass" name="pass" class="form-control form-control-lg" />
                    <label class="form-label" for="pass">Contraseña</label>
                  </div>
                  <div class="pt-1 mb-4">
                    <button  type="submit" class="btn btn-dark btn-lg btn-block" name="accion" value="SignIn">Iniciar Sesión!</button>
                  </div>       
                  <p class="mb-1">Sin cuenta todavía?
                  	<a  href="Controlador?accion=Register" style="text-decoration: none; border: none; background-color: none;">Registrate Aqui!</a>
                  </p>
                  <p class="mb-1">Problemas para entrar?
                  	<a  href="Controlador?accion=resetPassword" style="text-decoration: none; border: none; background-color: none;">Recupera tu acceso Aqui!</a>
                  </p>
              	</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>