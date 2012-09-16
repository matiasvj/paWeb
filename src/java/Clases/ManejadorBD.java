package Clases;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
      
  
public class ManejadorBD {
    private final static String driver = "com.mysql.jdbc.Driver";
    private final static String bd = "jdbc:mysql://192.168.56.101:3306/grupo2";
    private final static String usuario = "grupo2";
    private final static String password = "pa2012";
    
    private Connection conexion;
    private java.sql.Statement st;
    private static ManejadorBD instancia = null;
    
    public static ManejadorBD getInstancia(){
        if(instancia == null){
            instancia = new ManejadorBD();
        }
        return instancia;
    }
    
    private ManejadorBD() {
        try{
            Class.forName(driver);
            conexion = DriverManager.getConnection(bd, usuario, password);
            st = conexion.createStatement();
            System.out.println("Conexion exitosa");
        }
        catch(Exception ex){
            System.out.println("Error de conexion: "+ex.toString());
        }
    }
    
    public java.sql.Statement getStatement(){
        return st;
    }
   public ResultSet VerDetalleCompeticion(){
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM competiciones");
             return rs;
        } catch (SQLException ex) {
            return null;
        }
    }
   public ResultSet VerDetalleEquipos(){
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM equipos");
             return rs;
        } catch (SQLException ex) {
            return null;
        }
    }
}
