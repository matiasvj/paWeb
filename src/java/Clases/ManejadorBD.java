package Clases;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
      
  
public class ManejadorBD {
    private final static String driver = "com.mysql.jdbc.Driver";
    private final static String bd = "jdbc:mysql://192.168.56.102:3306/grupo2";
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
   /*La clase manejador es la que se encarga de la conexion de la base de datos y realizar las consultas.
    *En el metodo VerDetalleEquipos utilizamos un ArrayList de Equipos, donde los datos que se obtienen
    *de la consulta se iran correspondiendo con un indice dentro del Array. El metodo retorna la lista.
    */ 
    public ArrayList<Equipos> VerDetalleEquipos(){
      
        ArrayList<Equipos> listaEquipos=new ArrayList<Equipos>();
        try{
             ResultSet rs = st.executeQuery("select * from equipos" );
            while (rs.next())
            {
                Equipos Equi = new Equipos();
                Equi.setId(rs.getString("id_equipos"));
                Equi.setNombre(rs.getString("nombre"));
                listaEquipos.add(Equi);
            }
                rs.close();
                //st.close();
                //conexion.close(); 
                /*Estas lineas estan comentadas, pienso usarlas mas adelante, el problema
                que si la descomento, cuando doy un refrescar en la pagina VerDetalleEquipos
                me desaparece la lista. Si tengo la conexion y el estado, sigo teniendo
                presente los valores en mi tabla*/
                
             }  
            catch (Exception e){
                e.printStackTrace();
            }
           return listaEquipos;
    }
    /*Este metodo lo utilizo para obtenes los usuarios para luego comparar lo que tengo en el arraylist con los que ingreso
     al momento de login*/
    public ArrayList<Usuarios> ObtenerUsuarios(){
      
        ArrayList<Usuarios> listaUsuarios = new ArrayList<Usuarios>();
        try{
             ResultSet rs = st.executeQuery("select * from usuarios" );
            while (rs.next())
            {
                Usuarios Usu = new Usuarios();
                Usu.setEmail(rs.getString("Email"));
                Usu.setNombre(rs.getString("Nombre"));
                Usu.setPassword(rs.getString("password"));
                listaUsuarios.add(Usu);
            }
                rs.close();
                //st.close();
                //conexion.close();
             }  
            catch (Exception e){
                e.printStackTrace();
            }
           return listaUsuarios;
    }
}
