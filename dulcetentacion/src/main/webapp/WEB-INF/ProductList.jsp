<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="models.producto"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="models.usuario"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Products Catalog List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
session = request.getSession(false);
usuario user = session != null && session.getAttribute("ActualUser") != null? (usuario)session.getAttribute("ActualUser") : null;
	if(user != null && user.getId_usuario() != null){
%>
<h1 class="font-weight-bold">productos</h1>
	<div class="container">
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
						<a class="btn btn-primary" href="Controlador?accion=editProdut&productid=<%=product.getId_producto()%>">Editar</a>
						<a class="btn btn-danger" href="">Eliminar</a>
					</td>
					<%} %>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
<%}%>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>