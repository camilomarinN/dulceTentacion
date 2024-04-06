package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.onlineBD;
import models.producto;

public class productoRepository implements IRepository<producto>{

	Connection con;
	PreparedStatement pst;
	ResultSet rst;
	producto product = new producto();
	@Override
	public producto findById(int id) {
		product = new producto();
		String SQL = "select * from productos where id_producto="+id;
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			rst = pst.executeQuery();
			while (rst.next()) {
				product.setId_producto(rst.getInt(1));
				product.setNombre_producto(rst.getString(2));
				product.setDescripcion_producto(rst.getString(3));
				product.setPrecio_producto(rst.getBigDecimal(4));
				product.setTipo_producto(rst.getInt(5));
			}
		} catch (Exception e) {
			System.out.println("Error consulta PRODUCTS POR ID: " + e);
		}
		return product;

	}

	@Override
	public List<producto> findAll() {
		List<producto> Lista = new ArrayList<producto>();
		String SQL = "select * from productos";
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			rst = pst.executeQuery();
			while (rst.next()) {
				product = new producto();
				product.setId_producto(rst.getInt(1));
				product.setNombre_producto(rst.getString(2));
				product.setDescripcion_producto(rst.getString(3));
				product.setPrecio_producto(rst.getBigDecimal(4));
				product.setTipo_producto(rst.getInt(5));
				Lista.add(product);
			}
		} catch (Exception e) {
			System.out.println("Error consulta LIST PRODUCTS: " + e);
		}
		return Lista;
	}

	@Override
	public Integer save(producto product) {
		int result = 0;
		String SQL = "INSERT INTO PRODUCTOS VALUES('"+product.getNombre_producto()+"','"+product.getDescripcion_producto()+"','"
					  +product.getPrecio_producto()+"','"+product.getTipo_producto();
		
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			result = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error consulta del SAVE PRODUCTO: " + e);
		}
		return result;
	}

	@Override
	public Integer update(producto entity) {
		int result = 0;
		String SQL = "UPDATE PRODUCTOS SET nombre_producto='"+product.getNombre_producto()+"',descripcion_producto='"+product.getDescripcion_producto()+"',"
				+ "precio_producto="+product.getPrecio_producto()+", tipo_producto="+product.getTipo_producto();
		
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			result = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error consulta del UPDATE PRODUCTO: " + e);
		}
		return result;
	}

	@Override
	public Integer delete(int id) {
		int result = 0;
		String SQL = "DELETE FROM PRODUCTOS where id_producto="+id;
		
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			result = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error consulta del DELETE PRODUCTO: " + e);
		}
		return result;
	}

}
