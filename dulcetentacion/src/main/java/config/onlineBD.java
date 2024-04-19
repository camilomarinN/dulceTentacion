package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class onlineBD {

 private String classname = "oracle.jdbc.OracleDriver"; 
 private final String DB_USER = "admin";
 private final String DB_PASS = "dulceTentacionPPI507";
 private final String DB_URL = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.sa-bogota-1.oraclecloud.com))(connect_data=(service_name=g69ab1ea9ea59f9_dulcetentacion_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
 private Connection con;
 
  // Constructor 
  public onlineBD(){
	  try {
	      Class.forName(classname); 
	      con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS); 
	  } catch (ClassNotFoundException | SQLException e) {
	      System.out.println("Error" + e);
	  }
  }
	//Metodo de conexión 
	public Connection getConexio(){
		return con;
	}
 
	public static void main(String[] args) {
		onlineBD con = new onlineBD();   
			con.getConexio();
	}
}