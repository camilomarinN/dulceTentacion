package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.onlineBD;
import models.tipoProducto;

public class tipoProductoRepository implements IRepository<tipoProducto>{

	Connection con;
	PreparedStatement pst;
	ResultSet rst;
	tipoProducto tipoProducto = new tipoProducto();
	@Override
	public tipoProducto findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<tipoProducto> findAll() {
		List<tipoProducto> Lista = new ArrayList<tipoProducto>();
		String SQL = "select * from tipo_producto";
		onlineBD cn = new onlineBD();
		try {
			con = cn.getConexio();
			pst = con.prepareStatement(SQL);
			rst = pst.executeQuery();
			while (rst.next()) {
				tipoProducto = new tipoProducto();
				tipoProducto.setId_tipo_producto(rst.getInt(1));
				tipoProducto.setNombre_tipo_producto(rst.getString(2));
				Lista.add(tipoProducto);
			}
		} catch (Exception e) {
			System.out.println("Error consulta LIST PRODUCTS TYPES: " + e);
		}
		return Lista;
	}

	@Override
	public Integer save(tipoProducto entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(tipoProducto entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
