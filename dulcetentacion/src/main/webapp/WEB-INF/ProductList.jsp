<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="models.producto"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="models.usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.tipoProducto"%>
<!DOCTYPE html>
<html class="h-100 m-0 p-0">
<head>
	<meta charset="UTF-8">
	<title>Products Catalog List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
        *{
        font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body class="h-100 m-0 p-0">
<%
session = request.getSession(false);
usuario user = session != null && session.getAttribute("ActualUser") != null? (usuario)session.getAttribute("ActualUser") : null;
	if(user != null && user.getId_usuario() != null){
%>
<div id="wrapper" class="position-relative" style="min-height:100%;">
	<header>
		<nav class="navbar navbar-expand-md navbar-light p-1 fw-bold" style="background-color: #F0DEDE !important;">
			<div class="container-fluid">
				<% if(user == null || user.getId_usuario() == null){%>
				<a class="navbar-brand mx-2" href="Controlador?accion=Login">Iniciar sesión</a>
				<% }else{ %>
				<a class="navbar-brand mx-2" href="Controlador?accion=myProfile">Perfil</a>
				<a class="navbar-brand mx-2" href="Controlador?accion=Index">Catálogo</a>
				<div class="ms-auto">
					<a class="navbar-brand mx-2" href="Controlador?accion=Logout">Cerrar sesión</a>
				</div>
				<%} %>
			</div>
		</nav>
	</header>
	<div class="container" style="padding-bottom: 130px;">
		<h1 class="font-weight-bold my-3">productos</h1>
	    <div class="accordion mb-3" id="FiltersAccordeon">
	    	<div class="accordion-item">
	        	<h2 class="accordion-header">
	          		<button class="accordion-button font-weight-bold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AccordeonBody" aria-expanded="false" aria-controls="AccordeonBody">
	            		Filtros
	          		</button>
	        	</h2>
		        <div id="AccordeonBody" class="accordion-collapse collapse mb-2" data-bs-parent="#FiltersAccordeon" style="">
	          		<div class="accordion-body">
	          		<form>
						<div class="row d-flex mb-3">
							<div class="col-6 form-outline">
					         	<label class="form-label" for="tipoProducto">Tipo de producto*</label>
					         	<select id="tipoProducto" name="tipoProducto" class="form-select form-select-lg" aria-label=".form-select-lg example">
									<option value="0">Selecciona una opción</option>
									 <%
									 List<tipoProducto> optionsTypes = (List<tipoProducto>) request.getAttribute("tipoProductos");
						          		Iterator<tipoProducto> iter = optionsTypes.iterator();
						           		tipoProducto type = null;
						       			while(iter.hasNext()){
						       				type = iter.next();
									 %>
								 	<option value="<%=type.getId_tipo_producto()%>"><%= type.getNombre_tipo_producto()%></option>
								  	<%}%>
								</select>
				       		</div>
						</div>
						<div class="row d-flex">
					    	<div class="text-center">
									<button   type="submit"  name="accion" value="ProductsList" class="btn btn-primary mb-3" >Aplicar filtros</button>
				    		</div>
						</div>
					</form>
	          		</div>
	        	</div>
	      	</div>
	    </div>
	    <div class="text-end">
	    	<a class="btn btn-primary mb-3" href="Controlador?accion=createProduct">Crear producto</a>
		</div>
		<table class="table table-bordered" border="1">
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
			Iterator<producto> iter2 = products.iterator();
			producto product = null;
			while(iter2.hasNext()){
				product = iter2.next();
			%>
				<tr>
					<td><%=product.getNombre_producto() %></td>
					<td><%=product.getDescripcion_producto() %></td>
					<td><%=product.getPrecio_producto() %></td>
					<td><%=product.getTipo_producto() %></td>
					<% if(user.getRol_usuario() == 1){ %>
					<td class="d-flex">
						<a class="btn btn-primary m-1" href="Controlador?accion=editProduct&productid=<%=product.getId_producto()%>">Editar</a>
						<a class="btn btn-danger m-1" onclick="validarDeleteProducto(<%=product.getId_producto()%>);">Eliminar</a>
					</td>
					<%} %>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
<%}%>
 <!-- FOOTER -->
   		<footer class="py-3 bg-light fw-bold" style="background-color: #F0DEDE !important;">
	   	<ul class="nav justify-content-center border-bottom pb-3 mb-3">
	     	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Preguntas frecuentes</a></li>
	     	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Sobre nuestros productos</a></li>
	    	<li class="nav-item"><a href="#" class="nav-link px-2 text-dark">Acerca de nosotros</a></li>
	   	</ul>
	   	<hr class="featurette-divider">
 		<p class="text-center text-dark">© 2024 DulceTentacion, Software Productions</p>
	</footer>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</div>
</body>
</html>