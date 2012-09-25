<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" import="Clases.*, java.lang.*"%><%/*importo las clases que estan en el paquete Clases.*/%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
        <link href="Estilo.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
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
            <div id="estado_sesion"  ><h4>Bienvenido: <%out.print(session.getAttribute("username")); %>&nbsp;&nbsp;<a href="Logout.jsp">Cerrar Sesion</a></h4></div>
            <%}%>    
    </div>
    </div>
    <!--Fin cabecera-->
    <!--Barra de menu-->
    <div id ="menu">
        <div class="rightbg">
                <div class="leftbg">
                        <div class="padding">
                            <ul>
                                <li><span>Sobre nosotros</span></li>
                                <li><a href="#">Usuarios</a></li>
                                <li><a href="Competiciones.jsp">Competiciones</a></li>
                                <li><a href="#">Partidos</a></li>
                                <li><a href="#">Contacto</a></li>
                            </ul>
                        </div>
               </div>
        </div> 
     </div>
     </div>
    <!--fin Barra de menu-->
    <!--Contenido-->
        <div class="centro">
            <!--Cargo un array de competiciones con los resultados de la consulta--> 
            <%
             ManejadorBD mbd =  ManejadorBD.getInstancia();
             
             ArrayList<Competiciones> ListaCompeticiones = new ArrayList<Competiciones>();
             try{
                    ResultSet tabla =  mbd.VerDetalleCompeticion();
                    while (tabla.next()) {
                       Competiciones c = new Competiciones();
                       c.setId(tabla.getObject("ID_Competicion").toString());
                       c.setNombre(tabla.getObject("Nombre").toString());
                       ListaCompeticiones.add(c);
                   } 
                 } catch (SQLException ex) {
                        out.println("Error"+ex.toString());
                    }
            %>
            <form method="POST" action="Competiciones.jsp">    
                <table>
                    <tr>
                        <td>Nombre</td>
                    </tr>
                
                        <%
                        
                            for (int i=0;i<ListaCompeticiones.size();i++)
                            {
                               out.println("<tr>");
                               out.println("<td><a href=Competiciones.jsp>"+ListaCompeticiones.get(i).getNombre()+"</a></td>");
                               out.println("</tr>");
                            }
                        %>
                </table>
            </form>         
        </div>
    <!--fin Contenido-->
</body>
</html>