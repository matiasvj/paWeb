
package Clases;

import Clases.ManejadorBD;
import javax.sql.*;
public class Usuarios {
    private String Email;
    private String nombre;
    private String password;
    private String sexo;
    private String pais;
    ManejadorBD mbd = ManejadorBD.getInstancia();

    
    public Usuarios(){
    super();
    }
    public String getSexo(){
        return sexo;
    }
    public void setSexo(String sexo){
        this.sexo=sexo;
    }
    public String getPais(){
        return pais;
    }
    public void setPais(String Pais){
        this.pais=Pais;
    }
    public String getEmail() {
        return Email;
    }

    public String getNombre() {
        return nombre;  
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
    public void Registro_Usuario(){
    mbd.registroUsuario(this.getNombre(), this.getEmail(),this.getPassword(), this.getSexo(), this.getPais());
    }
    
}
