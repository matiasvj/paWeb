<%@page import="java.util.ArrayList"%>
<%@page language="java" import="Clases.*, java.lang.*"%><%/*importo las clases que estan en el paquete Clases.*/%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Detalle de Equipos</title>
        <style type="text/css">@import url("Estilo.css"); </style>  
    </head>
    <body>
        <%
        String activo_usuario =  (String)session.getAttribute("nombre_usuario");
       
        if(activo_usuario!=null)
            {
             out.println("Conectado: "+activo_usuario+"   <a href=\"Logout.jsp\" >Cerrar Sesion</a>");
            
          %>
        <form>
            <table align="center"  border=1 >
                 <div  id="Competicion">
                    <tr>
                    <td>Id Equipo</td>
                        <td>Nombre</td>
                    </tr>
                   <%
                        ArrayList<Equipos> lista = ManejadorBD.getInstancia().VerDetalleEquipos();
                        for (int i=0;i<lista.size();i++)
                        {
                           out.println("<tr>");
                           out.println("<td><a href=http://www.google.com.uy>"+lista.get(i).getID()+"</a></td>");
                           out.println("<td>"+lista.get(i).getNombre()+"</td>");
                           out.println("</tr>");
                          }
                    /*El arraylist se completa con los datos obtenidos en la consulta. Para eso necesitamos importar */    
                    %> 
                    </div>
             </table>
        </form>
                    <%}
                      else{ out.println("No se ha logueado aun");%>
                        <jsp:forward page="Competiciones.jsp"/>;
                      
                     <%   } %>
    </body>
</html>
