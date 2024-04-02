package controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.usuario;
import repository.usuarioRepository;

/**
 * Servlet implementation class Controlador
 */
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String Login = "WEB-INF/Login.jsp";
	String Register = "WEB-INF/Registro.jsp";
	String Index = "index.jsp";
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acceso = "";
		String accion = request.getParameter("accion");
		
		switch (accion) {
		case "Login":
			acceso = Login;
			break;
		case "Regiter":
			acceso = Register;
			break;
		case "SignIn":
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			usuarioRepository userRepo = new usuarioRepository();
			usuario user = userRepo.SearchLogin(email, pass);
			
			if(user.getId_usuario() != null && !user.getId_usuario().toString().equals("")) {
				request.setAttribute("loginCorrecto", true);
			}
			acceso = Index;
			break;
		default:
			accion = Index;
			break;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(acceso);
		view.forward(request, response);
	}

}
