<%@page import="Clases.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <style type="text/css">@import url("Estilo.css"); </style>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
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
    </div>
    <!--Fin cabecera-->
    <!--Contendio-->
    <div class="contenido">
            <table>
            <tr>
                <%
                Usuarios u = new Usuarios();
                u.setNombre("Michael");
                String edit_nombre = "charco";
                request.setAttribute("edit_nombre", u);
                    %>
                <td>Nombre de Usuario:</td><td><input type="text" name=edit_nombre_usuario  ></td>
            </tr>   
            </table>
        </div>
    </body>
</html>
