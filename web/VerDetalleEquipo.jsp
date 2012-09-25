<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="Clases.*, java.lang.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        
<link href="Estilo.css" rel="stylesheet" type="text/css" />
<!--script src="funciones.js" type="text/javascript"></script-->
</head>

<body id="index" background="fondo.jpg">
    <div id="main">
    <!--Cabezal arriba donde esta logo-->    
    <div class="cabezal">
            <div class="left"><!--Se usa para posicionar el objeto dentro del div cabecera logo-->
                <a href="index.jsp"><img alt=""   src="pr_centro.png" /></a><br />
	    </div>
        <div class="right">
              <div id="estado_sesion"  ><h4>Bienvenido: <%out.print(session.getAttribute("username")); %>&nbsp;&nbsp; <a href="Perfil_Usuario.jsp">Editar Perfil</a>&nbsp;&nbsp;<a href="Logout.jsp">Cerrar Sesion</a></h4></div>
    </div>
    </div>
    <!--Fin cabecera-->
    
        <!--Contenido-->
        <div class="centro">
           <table> 
            <%
            Equipos e = new Equipos();
            String id = request.getParameter("cod");
            int ID = Integer.parseInt(id);
            ManejadorBD mbd = ManejadorBD.getInstancia();
            ResultSet eq = mbd.VerDetalleEquipo(ID);
            while(eq.next()){
               
                 e.setId(eq.getObject("id_equipos").toString());
                 e.setNombre(eq.getObject("nombre").toString());
            }
            out.println("<tr>");
            out.println("<td>ID Equipo: <td>"+e.getID()+"</td></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>Nombre Equipo: <td>"+e.getNombre()+"</td></td>");
            out.println("</tr>");
            %>
            </table>
            <h4>Jugadores</h4>
            <table>
                <%
                ResultSet jugadores= mbd.VerJugadoresEquipo(ID);
                if (jugadores.first()){
                    out.println("<tr>");
                    out.println("<td>"+jugadores.getObject("jugadores.nombrecompleto") +"</td>");
                    out.println("</tr>");
                    while(jugadores.next()){
                    out.println("<tr>");
                    out.println("<td>"+jugadores.getObject("nombrecompleto") +"</td>");
                    out.println("</tr>");
                                       }
                }
                %>
            </table>
            <form method="POST" action="DetalleJugador.jsp.jsp">   
            <table>
                <%
                //tabla con links a detalle de jugador
                try{
                    ResultSet jugador= mbd.VerJugadoresEquipo(ID);
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
        </div>
      </div>
</body>
</html>