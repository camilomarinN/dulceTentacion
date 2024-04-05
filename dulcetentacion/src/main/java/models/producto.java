package models;

import java.math.BigDecimal;

public class producto {

	private int id_producto;
	private String nombre_producto;
	private String descripcion_producto;
	private BigDecimal precio_producto;
	private int tipo_producto;
	
	public producto() {
		// TODO Auto-generated constructor stub
	}

	public producto(int id_producto, String nombre_producto, String descripcion_producto, BigDecimal precio_producto,
			int tipo_producto) {
		super();
		this.id_producto = id_producto;
		this.nombre_producto = nombre_producto;
		this.descripcion_producto = descripcion_producto;
		this.precio_producto = precio_producto;
		this.tipo_producto = tipo_producto;
	}



	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}

	public String getNombre_producto() {
		return nombre_producto;
	}

	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}

	public String getDescripcion_producto() {
		return descripcion_producto;
	}

	public void setDescripcion_producto(String descripcion_producto) {
		this.descripcion_producto = descripcion_producto;
	}

	public BigDecimal getPrecio_producto() {
		return precio_producto;
	}

	public void setPrecio_producto(BigDecimal precio_producto) {
		this.precio_producto = precio_producto;
	}

	public int getTipo_producto() {
		return tipo_producto;
	}

	public void setTipo_producto(int tipo_producto) {
		this.tipo_producto = tipo_producto;
	}
	
	
}
