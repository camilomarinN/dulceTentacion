package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import config.ConnectionBD;
import config.onlineBD;
import models.usuario;

public class usuarioRepository implements IRepository<usuario>{

	Connection con;
	PreparedStatement pst;
	ResultSet rst;
	usuario user = new usuario();
	
	public usuarioRepository() {
	}
	
	public usuario SearchLogin(String email, String password) {
		String SQL = "select * from usuarios where email_usuario='"+email+"' and contrasenia_usuario='"+password+"'";
		user = new usuario();
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			rst = pst.executeQuery();
			while(rst.next()) {
				user.setId_usuario(rst.getString(1));
				user.setNombre_usuario(rst.getString(2));
				user.setPrimer_apellido_usuario(rst.getString(3));
				user.setSegundo_apellido_usuario(rst.getString(4));
				user.setEmail_usuario(rst.getString(5));
				user.setContrasenia(rst.getString(6));
				user.setRol_usuario(rst.getInt(7));
			}
		} catch (Exception e) {
			System.out.println("Error consulta del LOGIN: "+ e);
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
