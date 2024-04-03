package config;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

public class onlineBD {

 private final String DB_USER = "admin";
 private final String DB_PASS = "dulceTentacionPPI507";
 private final String DB_URL = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.sa-bogota-1.oraclecloud.com))(connect_data=(service_name=g69ab1ea9ea59f9_dulcetentacion_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
 private final String CON_FACTORY_CLASS_NAME="oracle.jdbc.pool.OracleDataSource";
 private Connection con; 
 
  // Constructor 
  public onlineBD(){
	  
	// Get the PoolDataSource for UCP
	    PoolDataSource pds = PoolDataSourceFactory.getPoolDataSource();
	    try {
	    	 // Set the connection factory first before all other properties
		    pds.setConnectionFactoryClassName(CON_FACTORY_CLASS_NAME);
		    pds.setURL(DB_URL);
		    pds.setUser(DB_USER);
		    pds.setPassword(DB_PASS);
		    pds.setConnectionPoolName("JDBC_UCP_POOL");

		    // Default is 0. Set the initial number of connections to be created
		    // when UCP is started.
		    pds.setInitialPoolSize(0);

		    // Default is 0. Set the minimum number of connections
		    // that is maintained by UCP at runtime.
		    pds.setMinPoolSize(0);

		    // Default is Integer.MAX_VALUE (2147483647). Set the maximum number of
		    // connections allowed on the connection pool.
		    pds.setMaxPoolSize(Integer.MAX_VALUE);
		} catch (Exception e) {
			System.out.println("Errores en la conexión: "+e.getMessage());
		}
	    
	    // Get the database connection from UCP.
	    try (Connection conn = pds.getConnection()) {
	      System.out.println("Available connections after checkout: "
	          + pds.getAvailableConnectionsCount());
	      System.out.println("Borrowed connections after checkout: "
	          + pds.getBorrowedConnectionsCount());
	      selectRoles(conn);
	    } catch (SQLException e) {
	        System.out.println("dulceTentaciónBD - "
	          + "doSQLWork()- SQLException occurred : " + e.getMessage());
	    }
	  
  }
  
//EJEMPLO DE CONEXIÓN Y FUNCIONALIDAD
  /*private static void doSQLWork(Connection conn) throws SQLException { 
	    String queryStatement = "SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_CITY," 
	      + "CUST_CREDIT_LIMIT FROM SH.CUSTOMERS WHERE ROWNUM < 20 order by CUST_ID";
	      
	    System.out.println("\n Query is " + queryStatement);
	    
	    conn.setAutoCommit(false);
	    // Prepare a statement to execute the SQL Queries.
	    try (Statement statement = conn.createStatement(); 
	      // Select 20 rows from the CUSTOMERS table from SH schema. 
	      ResultSet resultSet = statement.executeQuery(queryStatement)) {
	        System.out.println(String.join(" ", "\nCUST_ID", "CUST_FIRST_NAME", 
	             "CUST_LAST_NAME", "CUST_CITY", "CUST_CREDIT_LIMIT"));
	        System.out.println("-----------------------------------------------------------");
	        while (resultSet.next()) {
	          System.out.println(resultSet.getString(1) + " " + resultSet.getString(2) + " " +
	           resultSet.getString(3)+ " " + resultSet.getString(4) + " " +
	           resultSet.getInt(5));
	        }
	      System.out.println("\nCongratulations! You have successfully used Oracle Autonomous Database\n");
	      } 
	  } // End of doSQLWork
 */ 
//EJEMPLO DE CONEXIÓN Y FUNCIONALIDAD TABLA PROPIA
  private static void selectRoles(Connection conn) throws SQLException { 
	    String queryStatement = "select * from ROLES";
	      
	    System.out.println("\n Query is " + queryStatement);
	    
	    conn.setAutoCommit(false);
	    // Prepare a statement to execute the SQL Queries.
	    try (Statement statement = conn.createStatement(); 
	      // Select 20 rows from the CUSTOMERS table from SH schema. 
	      ResultSet resultSet = statement.executeQuery(queryStatement)) {
	        System.out.println("-----------------------------------------------------------");
	        while (resultSet.next()) {
	          System.out.println(resultSet.getString(1) + " " + resultSet.getString(2));
	        }
	      System.out.println("\nCongratulations! You have successfully used Oracle Autonomous Database\n");
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