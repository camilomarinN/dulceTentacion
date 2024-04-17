<%@page import="models.producto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>configuración de productos</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%
	producto product = (producto)request.getAttribute("product");
	%>
	<section class="vh-100" style="background-color: #9A616D;">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-10">
	        <div class="card" style="border-radius: 1rem;">
	          <div class="row g-0 d-flex">
	            <div class="col-12 align-items-center">
	              <div class="card-body p-4 p-lg-5 text-black">
	                  <h5 class="font-weight-bold mb-3 pb-3" style="letter-spacing: 1px;">Formulario de producto</h5>
	                  <form action="Controlador" method="POST" class="flex-grow-1">
	                  	<input type="hidden" id="idProducto" value="<%=product.getId_producto() %>">
	                  	<div class="row d-flex">
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input type="text" id="nombreProducto" name="nombreProducto" class="form-control form-control-lg" value="<%=product.getNombre_producto()%>"/>
		                    <label class="form-label" for="document">nombre del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input type="text" id="descripcionProducto" name="descripcionProducto" class="form-control form-control-lg" value="<%=product.getDescripcion_producto() %>"/>
		                    <label class="form-label" for="email">descripción del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input id="precioProducto" name="precioProducto" class="form-control form-control-lg" value="<%=product.getPrecio_producto()%>"/>
		                    <label class="form-label" for="pass">precio del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <select id="tipoProducto" class="form-control form-select">
							  <option value="0" selected>Open this select menu</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
		                    <label class="form-label" for="name">Tipo de producto*</label>
		                  </div>
		                  <div class="pt-1 mb-4 text-center">
						    <a class="btn btn-dark btn-lg btn-block" onclick="validarFormulario();" name="accion" value="updateProduct">Guardar</a>
						</div>
					  </div>
	                </form>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="${pageContext.request.contextPath}/js/producto.js"></script>
	<script type="text/javascript">
		var tipoProducto = <%=product.getTipo_producto()%>
		
		if(tipoProducto != "0" && tipoProducto != undefined && tipoProducto != ""){
			jQuery('#tipoProducto').val(tipoProducto);
		}
	</script>
</body>
</html>