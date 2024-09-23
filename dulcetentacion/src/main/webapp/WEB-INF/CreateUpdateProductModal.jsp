<%@page import="models.producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.tipoProducto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>configuración de productos</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%
	producto product = null;
	try{
		product = (producto)request.getAttribute("product");
	}catch(Exception e){
		System.out.println("Error obtencion del producto en la modal de nuevo/editado: Error - "+e.getMessage());
	}
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
	                  <form id="ProductForm" action="Controlador?accion=saveProduct" method="POST">
	                  	<input type="hidden" id="idProducto" name="idProducto"  value="<%= product!= null ? product.getId_producto() : "" %>">
	                  	<div class="row d-flex">
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input type="text" id="nombreProducto" name="nombreProducto" class="form-control form-control-lg" value="<%= product!= null ?product.getNombre_producto() : "" %>"/>
		                    <label class="form-label" for="document">nombre del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input type="text" id="descripcionProducto" name="descripcionProducto" class="form-control form-control-lg" value="<%=product!= null ? product.getDescripcion_producto() : "" %>"/>
		                    <label class="form-label" for="email">descripción del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
		                    <input maxlength="12" id="precioProducto" name="precioProducto" class="form-control form-control-lg" value="<%=product!= null ? product.getPrecio_producto() : "" %>"/>
		                    <label class="form-label" for="pass">precio del producto*</label>
		                  </div>
		                  <div class="col-12 col-lg-6 col-xl-6 form-outline mb-4">
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
		                    <label class="form-label" for="name">Tipo de producto*</label>
		                  </div>
		                  <div class="pt-1 mb-4 text-center">
						    <a class="btn btn-dark btn-lg btn-block" onclick="validarFormulario();">Guardar</a>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="${pageContext.request.contextPath}/js/producto.js"></script>
	<script type="text/javascript">
		var tipoProducto = <%=product!= null ? product.getTipo_producto() : 0%>
		
		if(tipoProducto != "0" && tipoProducto != undefined && tipoProducto != ""){
			jQuery('#tipoProducto').val(tipoProducto);
		}
	</script>
</body>
</html>