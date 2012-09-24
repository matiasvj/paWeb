<%-- 
    Document   : DetalleJugadores
    Created on : 23-sep-2012, 20:49:13
    Author     : Usaurio
--%>

<%@page import="Clases.ManejadorBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <form method="POST" action="DetalleJugador.jsp.jsp">   
            <table>
                <%
                //tabla con links a detalle de jugador
                try{
                    ManejadorBD mbd=ManejadorBD.getInstancia();
                    ResultSet jugador= mbd.getStatement().executeQuery("select * from jugadores");
                    if (jugador.first()){
                        out.println("<tr>");
                        out.println("<td><a href=DetalleJugador.jsp?cod="+jugador.getObject("id_jugador")+">"+jugador.getObject("nombrecompleto")+"</a></td>");
                        out.println("</tr>");
                        while(jugador.next()){
                            out.println("<tr>");
                            out.println("<td><a href=DetalleJugador.jsp?cod="+jugador.getObject("id_jugador")+">"+jugador.getObject("nombrecompleto")+"</a></td>");
                            out.println("</tr>");
                        }
                    }else{
                        out.println("<h2>Este equipo aun no tiene jugadores asignados</h2>");
                    }
                } catch(Exception ex){
                    out.println("<h2>error en la consulta de jugadores</h2>");
                }
                %>
            </table>
            </form>
        </div>
    </body>
</html>
