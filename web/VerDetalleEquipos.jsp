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

   
<!--script src="funciones.js" type="text/javascript"></script-->
</head>

<body id="index">
    <!--Chequear sesion iniciada-->
   <%if(session.getAttribute("username")==null){
    %>
    <script>alert("Debe iniciar sesion primero");
        window.location.href='index.jsp';</script>
   <%}%>
    <div id="main">
    <!--Cabezal arriba donde esta logo-->    
    <div class="cabezal">
            <div class="left"><!--Se usa para posicionar el objeto dentro del div cabecera logo-->
                <a href="index.jsp"><img alt=""   src="pr_centro.png" /></a><br />
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
              if(session.getAttribute("username")!=null){
             ManejadorBD mbd =  ManejadorBD.getInstancia();
             
             ArrayList<Equipos> ListaEquipos = new ArrayList<Equipos>();
             try{
                    ResultSet tabla =  mbd.VerDetalleEquipos();
                    while (tabla.next()) {
                       Equipos e = new Equipos();
                       e.setId(tabla.getObject("id_equipos").toString());
                       e.setNombre(tabla.getObject("nombre").toString());
                       ListaEquipos.add(e);
                   } 
                 } catch (SQLException ex) {
                        out.println("Error"+ex.toString());
                    }
            %>
            <form method="POST" action="VerDetalleEquipos.jsp.jsp">    
                <table id="detalles_Equipos">
                    <tr>
                        <td>Nombre</td>
                    </tr>
                
                        <%
                            int id=3;
                            for (int i=0;i<ListaEquipos.size();i++)
                            {
                               out.println("<tr>");
                               out.println("<td><input type=hidden id=seleccion><a href=VerDetalleEquipos.jsp>"+ListaEquipos.get(i).getNombre()+"</a></td>");
                               out.println("</tr>");
                               id = Integer.parseInt(ListaEquipos.get(i).getID());
                               }
                            out.println(id);
                            ResultSet datos = mbd.VerDetalleEquipos(id);
                            datos.next();
                            Equipos e1 = new Equipos();
                            e1.setNombre(datos.getObject("Nombre").toString());
                            out.println("<tr><td>Nombre: "+e1.getNombre()+"</td></tr>");
                            String ch = "";
                           
            
                        %>
                </table>
            </form>         <%}
                      %>
        </div>
    <!--fin Contenido-->
</body>
</html>
