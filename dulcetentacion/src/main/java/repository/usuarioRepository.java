package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import config.ConnectionBD;
import models.usuario;

public class usuarioRepository implements IRepository<usuario>{

	ConnectionBD cn = new ConnectionBD();
	Connection con;
	PreparedStatement pst;
	ResultSet rst;
	usuario user = new usuario();
	
	public usuarioRepository() {
	}
	
	public usuario SearchLogin(String email, String password) {
		String SQL = "select * from usuarios where email_usuario='"+email+"' and contrasenia_usuario='"+password+"'";
		user = new usuario();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			rst = pst.executeQuery();
			while(rst.next()) {
				user.setId_usuario(rst.getString("id_usuario"));
				user.setNombre_usuario(rst.getString("nombre_usuario"));
				user.setPrimer_apellido_usuario(rst.getString("primer_apellido_usuario"));
				user.setSegundo_apellido_usuario(rst.getString("segundo_apellido_usuario"));
				user.setEmail_usuario(rst.getString("email_usuario"));
				user.setContrasenia(rst.getString("contrasenia_usuario"));
				user.setRol_usuario(rst.getInt("rol_usuario"));
			}
		} catch (Exception e) {
			System.out.println("Error consulta del LOGIN: "+ e);
			return null;
		}
		return user;
	}
	
	@Override
	public usuario findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<usuario> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(usuario entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(usuario entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
	}

}
