<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LoginPage - Dulce Tentación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<section class="vh-100" style="background-color: #9A616D;">
	 <div class="container py-5 h-100">
	   <div class="row d-flex justify-content-center align-items-center h-100">
	     <div class="col-10">
	       <div class="card" style="border-radius: 1rem;">
	         <div class="row g-0 d-flex">
	           <div class="col-xl-6 d-none d-xl-block" style="background-color: #ece4e2;">
	             <img src="img/logo.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
	           </div>
	           <div class="col-12 col-xl-6 align-items-center">
	             <div class="card-body p-4 p-lg-5 text-black">
	                 <h5 class="font-weight-bold mb-3 pb-3" style="letter-spacing: 1px;">Registrate en nuestro sistema!</h5>
	                 <form action="Controlador" method="POST" class="flex-grow-1">
	                 <div id="part1" class="d-block">
	                  <div class="form-outline mb-4">
	                    <input type="text" id="document" name="document" class="form-control form-control-lg" />
	                    <label class="form-label" for="document">Documento de identidad*</label>
	                  </div>
	                  <div class="form-outline mb-4">
	                    <input type="text" id="email" name="email" class="form-control form-control-lg" />
	                    <label class="form-label" for="email">Correo Electronico*</label>
	                  </div>
	                  <div class="form-outline mb-4">
	                    <input type="password" id="pass" name="pass" class="form-control form-control-lg" />
	                    <label class="form-label" for="pass">Contraseña*</label>
	                  </div>
	                 	  <div class="pt-1 mb-4">
	                     	<a onclick="goPaso2();" class="btn btn-dark btn-lg btn-block">Siguiente paso</a>
	                 	  </div> 
	                 </div>
	                 <div id="part2" class="d-none">
	                  <div class="form-outline mb-4">
	                    <input type="text" id="name" name="name" class="form-control form-control-lg" />
	                    <label class="form-label" for="name">Nombre*</label>
	                  </div>
	                  <div class="form-outline mb-4">
	                    <input type="text" id="firstLastName" name="firstLastName" class="form-control form-control-lg" />
	                    <label class="form-label" for="firstLastName">Primer Apellido*</label>
	                  </div>
	                  <div class="form-outline mb-4">
	                    <input type="text" id="secondLastName" name="secondLastName" class="form-control form-control-lg"/>
	                    <label class="form-label" for="secondLastName">Segundo Apellido</label>
	                  </div>
	                  <div class="pt-1 mb-4 d-flex justify-content-between">
					    <a onclick="goPaso1();" class="btn btn-dark btn-lg mx-2">Atrás</a>
					    <button type="submit" class="btn btn-dark btn-lg btn-block" name="accion" value="SignUp">Regístrate</button>
					</div>
	                 </div>
	                 <p class="mb-5 pb-lg-2">ya posees una cuenta? 
	                 	<a  class="rounded" href="Controlador?accion=Login" style="text-decoration: none; border: none; background-color: none;">Inicia sesión Aqui!</a>
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
	<script src="${pageContext.request.contextPath}/js/Registro.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>