
package Clases;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Registro extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /* En este proyecto; este servlet no recibe ni debe recibir nada por GET,
         * asi que si se lleva a entrar al servelt
         * usando el metodo GET solamente redireccion al index.jsp
         */
        response.sendRedirect("index.jsp");
    }
    
    //Todo eso de http es para traer los datos del formulario que estan en la pagina de registro.jsp
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    //voy a crear una variable de session para guardar los mensajes asi puedo obtenerlos en la pagina que quiera luego    
    HttpSession respuesta = request.getSession(true);
    PrintWriter out = response.getWriter();
    ManejadorBD mbd = ManejadorBD.getInstancia();
    String nick = request.getParameter("login_usuario");
    String correo = request.getParameter("email_usuario");
    String pass = request.getParameter("contrasenia_usuario");
    String r_pass = request.getParameter("r_contrasenia_usuario");
    String sexo_masbien = request.getParameter("sexo_usuario");
    String pais = request.getParameter("pais_usuario");
    if(nick.isEmpty() || correo.isEmpty() || pass.isEmpty() || r_pass.isEmpty() || sexo_masbien.isEmpty() || pais.isEmpty() ){
        respuesta.setAttribute("Error", "No puede haber campos vacios");
    }else{
      if(pass.equals("r_pass")){
            mbd.registroUsuario(nick, correo, pass, sexo_masbien, pais);
            respuesta.setAttribute("Mensaje","Se ha creado el usuario: "+nick);
        }
        else{
            respuesta.setAttribute("Error", "La password no coinciden");
        }
    
    }
    
    }
}
