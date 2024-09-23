package controllers;

import java.io.IOException;
import java.math.BigDecimal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.producto;
import models.usuario;
import repository.productoRepository;
import repository.tipoProductoRepository;
import service.mensajeService;
import service.productoService;
import service.usuarioService;

public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// Redirecciones 
	private String Index = "index.jsp";
	private String Profile = "WEB-INF/ProfileUser.jsp";
	private String Login = "WEB-INF/Login.jsp";
	private String Register = "WEB-INF/Registro.jsp";
	private String productList = "WEB-INF/ProductList.jsp";
	private String createUpdateProduct = "WEB-INF/CreateUpdateProductModal.jsp";
	private String resetPassword = "WEB-INF/resetPassword.jsp";
	
	//Modelos y objetos
	private int ResultQuerys;
	private usuario user;
	private producto product;
	HttpSession session = null;
	private usuarioService userService = new usuarioService();
	private mensajeService  mensajeService;
	private productoService productService = new productoService();
	private productoRepository productRepo = new productoRepository();
	private tipoProductoRepository tipoProductRepo = new tipoProductoRepository();

    public Controlador() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultQuerys = 0;
		String acceso = "";
		String accion = request.getParameter("accion");
		switch(accion) {
			case "Login":
				acceso = Login;
				break;
			case "Register":
				acceso = Register;
				break;
			case "myProfile":
				acceso = Profile;
				break;
			case "ProductsList":
				String filter = request.getParameter("tipoProducto") != null ? request.getParameter("tipoProducto").toString() : null;
				request.setAttribute("Productos", productRepo.findAll(filter));
				request.setAttribute("tipoProductos", tipoProductRepo.findAll(null));
				acceso = productList;
				break;
			case "createProduct":
				request.setAttribute("tipoProductos", tipoProductRepo.findAll(null));
				acceso = createUpdateProduct;
				break;
			case "editProduct":
				int productid = Integer.parseInt(request.getParameter("productid"));
				request.setAttribute("product", productRepo.findById(productid));
				request.setAttribute("tipoProductos", tipoProductRepo.findAll(null));
				acceso = createUpdateProduct;
				break;
			case "deleteProduct":
				int deleteProductId = Integer.parseInt(request.getParameter("productid"));
				ResultQuerys = productService.deleteProduct(deleteProductId);
				session = request.getSession(false);
				if(ResultQuerys == 1) {
					 session.setAttribute("success", "¡El producto fue eliminado correctamente!");
				}else {
					session.setAttribute("error", "Algo a ocurrido al intentar eliminar el producto");
				}
				response.sendRedirect(request.getContextPath() + "/Controlador?accion=ProductsList");
				return;
			case "Logout":
				session = request.getSession(false);
				if(session != null && session.getAttribute("ActualUser") != null) {session.invalidate();}
				break;
			case "resetPassword":
				acceso = resetPassword;
				break;
			default:
				accion = Index;
				break;
		}
		RequestDispatcher view = request.getRequestDispatcher(acceso);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultQuerys = 0;
		String acceso = "";
		String accion = request.getParameter("accion");
		user = new usuario();
		switch (accion) {
		case "SignIn":
			user = userService.LoginUser(request.getParameter("email"), request.getParameter("pass"));
			if(user != null && user.getId_usuario() != null && !user.getId_usuario().toString().equals("")) {
				session = request.getSession();
				session.setAttribute("Login", true);
				session.setAttribute("ActualUser", user);
				acceso = Index;
			}else {
				session = request.getSession(false);
				if(session != null) {
					session.invalidate();
				}
				acceso = Login;
			}
			break;
		case "SignUp":
			session = request.getSession();
			user = new usuario(request.getParameter("document"),request.getParameter("name"),request.getParameter("firstLastName"), request.getParameter("secondLastName"), request.getParameter("email"), request.getParameter("pass"), 1);
			ResultQuerys = userService.saveUserData(user, "add");
			if(ResultQuerys == 1) {
				session.setAttribute("Login", true);
				session.setAttribute("ActualUser", userService.LoginUser(request.getParameter("email"), request.getParameter("pass")));
				acceso = Index;
			}else {
				if(session != null) {
					session.invalidate();
				}
				acceso = Register;
			}
			break;
		case "recoverPass":
			mensajeService = new mensajeService();
			mensajeService.SendMessage(request.getParameter("recoverEmail").toString(), "recuperación de contraseña - Dulce Tentación", mensajeService.RESET_PASSWORD_TEMPLATE);
			response.sendRedirect(request.getContextPath() + "/Controlador?accion=Login");
			return;
		case "saveProduct":
			int actualProductId = request.getParameter("idProducto") != null && request.getParameter("idProducto") != "" ? Integer.parseInt(request.getParameter("idProducto")) : 0;
			BigDecimal numeroBigDecimal = new BigDecimal(request.getParameter("precioProducto"));
			product = new producto(actualProductId, request.getParameter("nombreProducto"), request.getParameter("descripcionProducto"), numeroBigDecimal, Integer.parseInt(request.getParameter("tipoProducto").toString()));
			ResultQuerys = productService.saveProduct(product);
			session = request.getSession(false);	
			if(ResultQuerys == 1) {
				 session.setAttribute("success", "¡El producto se ha guardado correctamente!");
			}else {
				session.setAttribute("error", "Algo a ocurrido al intentar guardar el producto");
			}
			response.sendRedirect(request.getContextPath() + "/Controlador?accion=ProductsList");
			return;
		default:
			accion = Index;
			break;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(acceso);
		view.forward(request, response);
	}

}
