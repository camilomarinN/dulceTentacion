<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mi perfil - DulceTentación</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<% 
session = request.getSession(false);
usuario user = session != null && session.getAttribute("ActualUser") != null? (usuario)session.getAttribute("ActualUser") : null; 
%>
<header>
	<nav class="navbar navbar-expand-md navbar-light fixed-top p-1 fw-bold" style="background-color: #F0DEDE !important;">
		<% if(user == null || user.getId_usuario() == null){%>
		<a class="navbar-brand mx-2" href="Controlador?accion=Login">Iniciar sesión</a>
		<% }else{ %>
		<div>
			<a class="navbar-brand mx-2" href="Controlador?accion=myProfile">Perfil</a>
			<% if(user.getRol_usuario() == 1){%>
			<a class="navbar-brand mx-2" href="Controlador?accion=UsersList">Administración de usuarios</a>
			<a class="navbar-brand mx-2" href="Controlador?accion=ProductsList">Administración de productos</a>
			<% } %>
		</div>
		<div class="ms-auto">
			<a class="navbar-brand mx-2" href="Controlador?accion=Logout">Cerrar sesión</a>
		</div>
		<%} %>
    </nav>
  </header>
     <main class="container pt-5 mt-4">
	<section class="rounded" style="background-color: #F0DEDE !important;">
	  <div class="container py-3 px-3">
	    <div class="row d-flex">
	      <div class="col-lg-4">
	      <h3>Información personal</h3>
	       <div class="card mb-4">
	          <div class="card-body">
	            <div class="row">
	              <div class="col-12">
	                <p class="mb-0">Nombre:</p>
	              </div>
	              <div class="col-12">
	                <p class="text-muted mb-0"><%=user.getNombre_usuario()%></p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-12">
	                <p class="mb-0">Apellidos:</p>
	              </div>
	              <div class="col-12">
	                <p class="text-muted mb-0"><%=user.getPrimer_apellido_usuario() %> <%=user.getSegundo_apellido_usuario()%></p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-12">
	                <p class="mb-0">Correo electronico:</p>
	              </div>
	              <div class="col-12">
	                <p class="text-muted mb-0"><%=user.getEmail_usuario()%></p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-12">
	                <p class="mb-0">Rol asignado:</p>
	              </div>
	              <div class="col-12">
	                <p class="text-muted mb-0"><%=user.getRol_usuario()%></p>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-8">
	        <div class="row">
	          <h3>Mis pedidos</h3>
	          <div class="col-md-6">
	            <div class="card mb-4 mb-md-0">
	              <div class="card-body">
	                <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
	                </p>
	                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
	                    aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
	                    aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
	                    aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
	                    aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
	                <div class="progress rounded mb-2" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
	                    aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	</main>
	<!-- FOOTER -->
   	<footer class="py-3 my-4 bg-light fw-bold" style="background-color: #F0DEDE !important;">
	   	<ul class="nav justify-content-center border-bottom pb-3 mb-3">
	     	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Preguntas frecuentes</a></li>
	     	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Sobre nuestros productos</a></li>
	    	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Acerca de nosotros</a></li>
	   	</ul>
	   	<hr class="featurette-divider">
 		<p class="text-center text-dark">© 2024 DulceTentacion, Software Productions</p>
	</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>