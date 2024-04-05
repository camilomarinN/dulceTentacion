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
			System.out.println("Error consulta de productos por ID: " + e);
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
			System.out.println("Error consulta lista de productos: " + e);
		}
		return Lista;
	}

	@Override
	public Integer save(producto entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(producto entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
