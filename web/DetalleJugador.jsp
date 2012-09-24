<%-- 
    Document   : DetalleJugador
    Created on : 23-sep-2012, 17:39:35
    Author     : Usaurio
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Jugador</title>
    </head>
    <body>
        <%
            out.println("<h2>Detalle del jugador</h2>");
            String id = request.getParameter("cod");
            int ID = Integer.parseInt(id);
            ManejadorBD mbd = ManejadorBD.getInstancia();
            ResultSet eq = mbd.getStatement().executeQuery("select * from jugadores j, equipos e, jugadores_equipos je where id_jugador="+ID+" and jugador="+ID+" and id_equipos=equipo");
            while(eq.next()){
                out.println("<h2>Nombre: "+eq.getObject("j.nombre") +"</h2>");
                out.println("<h2>Equipo: "+eq.getObject("e.nombre")+"</h2>");
                out.println("<h2>Nombre completo: "+eq.getObject("nombrecompleto") +"</h2>");
                out.println("<h2>Nacionalidad: "+eq.getObject("nacionalidad") +"</h2>");
                out.println("<h2>Posicion: "+eq.getObject("posicion")+"</h2>");
                out.println("<h2>Altura: "+eq.getObject("altura") +" m.</h2>");
                out.println("<h2>Peso: "+eq.getObject("peso") +" kg</h2>");
                
            }
            
            %>
    </body>
</html>
