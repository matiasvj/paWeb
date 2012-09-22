package Clases;
import java.sql.*;
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
    //Ver Detalle Equipos, muestra lista de equipos
   public ResultSet VerDetalleEquipos(){
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM equipos");
             return rs;
        } catch (SQLException ex) {
            return null;
        }
    }
   //Ver Detalle Equipo, muestra informacion de un equipo seleccionado
   public ResultSet VerDetalleEquipo(int id){
        try {
            ResultSet rs = st.executeQuery("SELECT * FROM equipos WHERE id_equipos="+id+"");
            return rs;
        } catch (SQLException ex) {
            return null;
        }
   }
   public ResultSet login(String username){
        try {
            ResultSet rs = st.executeQuery("SELECT * from usuarios where nick = '"+username+"'");
            return rs;
        } catch (SQLException ex) {
            return null;
        }
   }
   public void registroUsuario(String username, String correo, String password, String sexo, String pais){
         try {
            st.executeUpdate("insert into usuarios (correo,nick,password, sexo, pais ) values ('"+correo+"','"+username+"','"+password+"','"+sexo+"','"+pais+"')");
            
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }
   
}
