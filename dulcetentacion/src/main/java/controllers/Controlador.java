package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.usuario;
import repository.productoRepository;
import repository.usuarioRepository;

public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String Index = "index.jsp";
	private String Login = "WEB-INF/Login.jsp";
	private String Register = "WEB-INF/Registro.jsp";
	private String productList = "WEB-INF/ProductList.jsp";
	private String createUpdateProduct = "WEB-INF/CreateUpdateProductModal.jsp";
	private usuario user = new usuario();
	private usuarioRepository userRepo = new usuarioRepository();
	private productoRepository productRepo = new productoRepository();
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acceso = "";
		String accion = request.getParameter("accion");
		switch(accion) {
			case "Login":
				acceso = Login;
				break;
			case "Register":
				acceso = Register;
				break;
			case "ProductsList":
				request.setAttribute("Productos", productRepo.findAll());
				acceso = productList;
				break;
			case "editProdut":
				int productid = Integer.parseInt(request.getParameter("productid"));
				request.setAttribute("product", productRepo.findById(productid));
				acceso = createUpdateProduct;
				break;
			case "Logout":
				HttpSession session = request.getSession(false);
				if(session != null && session.getAttribute("ActualUser") != null) {session.invalidate();}
				break;
			default:
				accion = Index;
				break;
		}
		RequestDispatcher view = request.getRequestDispatcher(acceso);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acceso = "";
		String accion = request.getParameter("accion");
		user = new usuario();
		switch (accion) {
		case "SignIn":
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			user = userRepo.SearchLogin(email, pass);
			if(user != null && user.getId_usuario() != null && !user.getId_usuario().toString().equals("")) {
				HttpSession session = request.getSession();
				session.setAttribute("ActualUser", user);
				acceso = Index;
			}else {
				HttpSession session = request.getSession(false);
				session.invalidate();
				acceso = Login;
			}
			break;
		case "SignUp":
			String registerDocument = request.getParameter("document");
			String registerEmail = request.getParameter("email");
			String registerPass = request.getParameter("pass");
			String registerName = request.getParameter("name");
			String registerFirstLastName = request.getParameter("firstLastName");
			String registerSecondLastName = request.getParameter("secondLastName");
			user = new usuario(registerDocument,registerName,registerFirstLastName,registerSecondLastName, registerEmail, registerPass, 1);
			int result = userRepo.save(user);
			if(result == 1) {
				request.setAttribute("SingUpUsuario", true);
				request.setAttribute("ActualUser", userRepo.SearchLogin(registerEmail, registerPass));
				acceso = Index;
			}else {
				request.setAttribute("SingUpUsuario", false);
				acceso = Register;
			}
			
			break;
		case "editProdut":
			int productid = Integer.parseInt(request.getParameter("productid"));
			request.setAttribute("productid", productid);
			acceso = createUpdateProduct;
			break;
		default:
			accion = Index;
			break;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(acceso);
		view.forward(request, response);
	}

}
