<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Dulce Tentación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
        font-family: 'Montserrat', sans-serif;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/Registro.js"></script>
</head>
<body>
	<section class="h-100 h-custom" style="background-color: #F0DEDE !important;">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-12">
	        <div class="card card-registration card-registration-2 shadow-lg" style="border-radius: 15px;">
	          <div class="card-body p-0">
	            <div class="row g-0">
	              <div class="col-lg-8">
	                <div class="p-5">
	                  <div class="d-flex justify-content-between align-items-center mb-5">
	                    <h1 class="fw-bold mb-0">Shopping Cart</h1>
	                    <h6 class="mb-0 text-muted">3 items</h6>
	                  </div>
	                  <hr class="my-4">
	
	                  <div class="row mb-4 d-flex justify-content-between align-items-center">
	                    <div class="col-md-2 col-lg-2 col-xl-2">
	                      <img
	                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img5.webp"
	                        class="img-fluid rounded-3" alt="Cotton T-shirt">
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-3">
	                      <h6 class="text-muted">Shirt</h6>
	                      <h6 class="mb-0">Cotton T-shirt</h6>
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-minus" viewBox="0 0 16 16">
							  <path d="M5.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5"/>
							  <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
							</svg>	                     
						  </button>
	                      <input id="form1" min="0" name="quantity" value="1" type="number"
	                        class="form-control form-control-sm" />
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-plus" viewBox="0 0 16 16">
							  <path d="M8.5 6a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V10a.5.5 0 0 0 1 0V8.5H10a.5.5 0 0 0 0-1H8.5z"/>
							  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1"/>
							</svg>
	                      </button>
	                    </div>
	                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
	                      <h6 class="mb-0">$ 44.00</h6>
	                    </div>
	                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
	                    </div>
	                  </div>
	                  <hr class="my-4">
	                  <div class="row mb-4 d-flex justify-content-between align-items-center">
	                    <div class="col-md-2 col-lg-2 col-xl-2">
	                      <img
	                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img6.webp"
	                        class="img-fluid rounded-3" alt="Cotton T-shirt">
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-3">
	                      <h6 class="text-muted">Shirt</h6>
	                      <h6 class="mb-0">Cotton T-shirt</h6>
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-minus" viewBox="0 0 16 16">
							  <path d="M5.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5"/>
							  <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
							</svg>	
	                      </button>
	                      <input id="form1" min="0" name="quantity" value="1" type="number"
	                        class="form-control form-control-sm" />
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-plus" viewBox="0 0 16 16">
							  <path d="M8.5 6a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V10a.5.5 0 0 0 1 0V8.5H10a.5.5 0 0 0 0-1H8.5z"/>
							  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1"/>
							</svg>                      
							</button>
	                    </div>
	                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
	                      <h6 class="mb-0">$ 44.00</h6>
	                    </div>
	                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
	                    </div>
	                  </div>
	                  <hr class="my-4">
	                  <div class="row mb-4 d-flex justify-content-between align-items-center">
	                    <div class="col-md-2 col-lg-2 col-xl-2">
	                      <img
	                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img7.webp"
	                        class="img-fluid rounded-3" alt="Cotton T-shirt">
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-3">
	                      <h6 class="text-muted">Shirt</h6>
	                      <h6 class="mb-0">Cotton T-shirt</h6>
	                    </div>
	                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-minus" viewBox="0 0 16 16">
							  <path d="M5.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5"/>
							  <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
							</svg>	
	                      </button>
	                      <input id="form1" min="0" name="quantity" value="1" type="number"
	                        class="form-control form-control-sm" />
	                      <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
	                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-plus" viewBox="0 0 16 16">
							  <path d="M8.5 6a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V10a.5.5 0 0 0 1 0V8.5H10a.5.5 0 0 0 0-1H8.5z"/>
							  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1"/>
							</svg>                      
							</button>
	                    </div>
	                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
	                      <h6 class="mb-0">$ 44.00</h6>
	                    </div>
	                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
	                    </div>
	                  </div>
	                  <hr class="my-4">
	                  <div class="pt-5">
	                    <h6 class="mb-0"><a href="Controlador?accion=Index" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Regresar</a></h6>
	                  </div>
	                </div>
	              </div>
	              <div class="col-lg-4 bg-body-tertiary">
	                <div class="p-5">
	                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
	                  <hr class="my-4">
	                  <div class="d-flex justify-content-between mb-4">
	                    <h5 class="text-uppercase">items 3</h5>
	                    <h5>$ 132.00</h5>
	                  </div>
	                  <h5 class="text-uppercase mb-3">Give code</h5>
	                  <div class="mb-5">
	                    <div data-mdb-input-init class="form-outline">
	                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
	                      <label class="form-label" for="form3Examplea2">Enter your code</label>
	                    </div>
	                  </div>
	                  <hr class="my-4">
	                  <div class="d-flex justify-content-between mb-5">
	                    <h5 class="text-uppercase">Total price</h5>
	                    <h5>$ 137.00</h5>
	                  </div>
	                  <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block btn-lg"
	                    data-mdb-ripple-color="dark">Realizar compra</button>
	                </div>
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