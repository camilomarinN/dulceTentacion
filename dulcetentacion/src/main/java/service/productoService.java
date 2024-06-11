package service;

import models.producto;
import repository.productoRepository;

public class productoService {

	private final productoRepository productRepo = new productoRepository();
	
	public int saveProduct(producto product) {
		int result = 0;
		try {
			if(product.getId_producto() == 0) {
				result = productRepo.save(product);
			}else {
				result = productRepo.update(product);
			}
		} catch (Exception e) {
			System.out.println("Servicio de productos - saveProduct - Error -" +e.getMessage());
		}
		return result;
	}
	
	public int deleteProduct(int idProducto) {
		int result= 0;
		try {
			if(idProducto == 0) {
				return result;
			}
			result = productRepo.delete(idProducto);
		} catch (Exception e) {
			System.out.println("Servicio de productos - deleteProduct - Error -" +e.getMessage());
		}
		return result;
	}
}
