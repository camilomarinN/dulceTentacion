<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="models.producto"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="models.usuario"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html class="h-100">
<head>
	<meta charset="UTF-8">
	<title>Products Catalog List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="h-100">
<%
session = request.getSession(false);
usuario user = session != null && session.getAttribute("ActualUser") != null? (usuario)session.getAttribute("ActualUser") : null;
	if(user != null && user.getId_usuario() != null){
%>
<header>
	<nav class="navbar navbar-expand-md navbar-light p-1 fw-bold" style="background-color: #F0DEDE !important;">
		<% if(user == null || user.getId_usuario() == null){%>
		<a class="navbar-brand mx-2" href="Controlador?accion=Login">Iniciar sesión</a>
		<% }else{ %>
		<div>
			<a class="navbar-brand mx-2" href="Controlador?accion=myProfile">Perfil</a>
			<% if(user.getRol_usuario() == 0){%>
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
	<div class="position-relative container" style="padding-bottom: 120px;">
		<h1 class="font-weight-bold my-3">productos</h1>
		<div class="text-end">
			<a class="btn btn-primary mb-3" href="Controlador?accion=createProduct">Crear producto</a>
		</div>
		<table class="table" border="1">
			<thead>
				<tr>
					<th>nombre producto</th>
					<th>descripcion producto</th>
					<th>precio producto</th>
					<th>tipo producto</th>
					<% if(user.getRol_usuario() == 0){ %>
					<th>Acciones</th>
					<%} %>
				</tr>
			</thead>
			<tbody>
			<%
			List<producto> products = new ArrayList<producto>();
			if(request.getAttribute("Productos") != null && !request.getAttribute("Productos").toString().isEmpty()){
				products = (List<producto>)request.getAttribute("Productos");
			}
			Iterator<producto> iter = products.iterator();
			producto product = null;
			while(iter.hasNext()){
				product = iter.next();
			%>
				<tr>
					<td><%=product.getNombre_producto() %></td>
					<td><%=product.getDescripcion_producto() %></td>
					<td><%=product.getPrecio_producto() %></td>
					<td><%=product.getTipo_producto() %></td>
					<% if(user.getRol_usuario() == 0){ %>
					<td>
						<a class="btn btn-primary" href="Controlador?accion=editProduct&productid=<%=product.getId_producto()%>">Editar</a>
						<a class="btn btn-danger" href="Controlador?accion=deleteProduct&productid=<%=product.getId_producto()%>">Eliminar</a>
					</td>
					<%} %>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
<%}%>
 <!-- FOOTER -->
   	<footer class="bg-light fw-bold position-absolute w-100" style="background-color: #F0DEDE !important; bottom: 0;">
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
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="${pageContext.request.contextPath}/js/producto.js"></script>
	<script type="text/javascript">
		var success = "<%=session != null && session.getAttribute("success") != null? (String)session.getAttribute("success") : ""%>";
		
		var error = "<%=session != null && session.getAttribute("error") != null? (String)session.getAttribute("error") : ""%>";
		if(success != null && success != ""){
			Swal.fire({
				  title: "proceso completado",
				  text: success,
				  icon: "success"
				});
		<%session.removeAttribute("success");%>
		
		}
		else if(error != null && error != ""){
			Swal.fire({
				  title: "Vaya...",
				  text: error,
				  icon: "error"
				});
		<%session.removeAttribute("error");%>
		}
	</script>
</body>
</html>