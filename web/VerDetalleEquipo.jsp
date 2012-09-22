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
            <%if(session.getAttribute("username")!=null){
                
              %>
              <div id="estado_sesion"  ><h4>Bienvenido: <%out.print(session.getAttribute("username")); %>&nbsp;&nbsp; <a href="Perfil_Usuario.jsp">Editar Perfil</a>&nbsp;&nbsp;<a href="Logout.jsp">Cerrar Sesion</a></h4></div>
            <%}%>    
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
        </div>
      </div>
</body>
</html>