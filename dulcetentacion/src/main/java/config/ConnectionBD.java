package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionBD {

	  //nombre por defecto
    private String username = "us_pruebas"; 
    // dejarla vacia si no tiene contraseña
    private String password = "123"; 
    //host de la bd
    private String host = "@localhost"; 
    //puerte de la bd 
    private String port = "1521";
    //esto dice donde tenemos el drivers de mysql
    private String classname = "oracle.jdbc.driver.OracleDriver"; 
    //direccionamiento de la bd
    private String url = "jdbc:oracle:thin:" + host + ":" + port + ":XE";   
                    
   private Connection con; 

   public ConnectionBD(){
        try {
            Class.forName(classname); 
            con = DriverManager.getConnection(url, username, password); 
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error" + e);
        }
    }

   public Connection getConexio(){
        return con; 
    }
}
