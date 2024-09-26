<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password - Dulce Tentación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<section class="vh-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0 d-flex shadow-lg">
            <div class="col-xl-6 d-none d-xl-block" style="background-color: #F0DEDE;">
              <img src="img/logo.jpg" alt="login form" class="img-fluid" />
            </div>
            <div class="col-12 col-xl-6 align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
              	<form action="Controlador" method="POST">
                  <h5 class="font-weight-bold" style="letter-spacing: 1px;">Hola de nuevo!</h5>
                  <h6 class="font-weight-bold mb-3 pb-3" style="letter-spacing: 1px;">ingresa aqui tu correo para enviarte una llave de acceso</h6>
                  <div class="form-outline mb-4">
                    <input type="email" id="recoverEmail" name="recoverEmail" class="form-control form-control-lg" />
                    <label class="form-label" for="recoverEmail">Correo Electronico</label>
                  </div>
                  <div class="pt-1 mb-4">
                    <button  type="submit" class="btn btn-dark btn-lg btn-block" name="accion" value="recoverPass">enviar llave</button>
                  </div>       
              	</form>
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