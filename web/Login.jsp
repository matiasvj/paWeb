<%@page language="java" import="Clases.*, java.lang.*"%>
<%@page import="java.util.ArrayList"%>

<%
            String nombre = null;
            nombre = request.getParameter("nombre_usuario");
            String pass = null;
            pass = request.getParameter("pass_usuario"); 
            String existe_nombre= null, existe_pass = null;
            ManejadorBD mbd = ManejadorBD.getInstancia();
            int x=0;
            ArrayList<Usuarios> lista = mbd.ObtenerUsuarios();
           //Verifico si existe el nombre de usuario y el pass en la base de datos            
            for (int i=0;i<lista.size();i++){
                          if(nombre == lista.get(i).getNombre()){
                             existe_nombre = nombre;
                             existe_pass = pass;
                          }
             }
            if (nombre == null || pass == null) {
               out.print("Datos incorrectos!");
              %>  <jsp:forward page="index.jsp"/><%
            }

            // Chequeamos los datos
            //toLowerCase() cambia el string a minusculas, solo lo utilizo en el nombre
            //trim() omite los espacios en blanco de los string. Lo uso para el nombre y el pass
            if (nombre.trim().equals(existe_nombre) && pass.trim().equals(existe_pass)) {
                //En una variable de session almaceno el nombre del usuario. 
                session.setAttribute("nombre_usuario",nombre); %>
                <jsp:forward page="index.jsp"/>
         <%   }
           else 
               {
                  out.print("Datos incorrectos!");%>
                 <a href="index.jsp">Volver</a>
                 
          <% }


            

%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<!--Redireccion automatica cuando inicio sesion-->
