package models;

public class usuario {

	private String id_usuario;
	private String nombre_usuario;
	private String primer_apellido_usuario;
	private String segundo_apellido_usuario;
	private String email_usuario;
	private String contrasenia;
	private int rol_usuario;
	
	public usuario() {
	}
	
	public usuario(String id_usuario, String nombre_usuario, String primer_apellido_usuario, String segundo_apellido_usuario, String email_usuario, String contrasenia, int rol_usuario) {
		this.id_usuario = id_usuario;
		this.nombre_usuario = nombre_usuario;
		this.primer_apellido_usuario = primer_apellido_usuario;
		this.segundo_apellido_usuario = segundo_apellido_usuario;
		this.email_usuario = email_usuario;
		this.contrasenia = contrasenia;
		this.rol_usuario = rol_usuario;
	}

	public String getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(String id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getNombre_usuario() {
		return nombre_usuario;
	}

	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}

	public String getPrimer_apellido_usuario() {
		return primer_apellido_usuario;
	}

	public void setPrimer_apellido_usuario(String primer_apellido_usuario) {
		this.primer_apellido_usuario = primer_apellido_usuario;
	}

	public String getSegundo_apellido_usuario() {
		return segundo_apellido_usuario;
	}

	public void setSegundo_apellido_usuario(String segundo_apellido_usuario) {
		this.segundo_apellido_usuario = segundo_apellido_usuario;
	}

	public String getEmail_usuario() {
		return email_usuario;
	}

	public void setEmail_usuario(String email_usuario) {
		this.email_usuario = email_usuario;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public int getRol_usuario() {
		return rol_usuario;
	}

	public void setRol_usuario(int rol_usuario) {
		this.rol_usuario = rol_usuario;
	}
	
}
