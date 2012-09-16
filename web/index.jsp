<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="Clases.*, java.lang.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
<link href="Estilo.css" rel="stylesheet" type="text/css" />
<!--script src="funciones.js" type="text/javascript"></script-->
</head>

<body id="index">
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
    <!--formulario de iniciio de cesion-->
        <div class="right">
            <div id="login" > 
                <form action="Login.jsp" method="post">
                    <table>         
                         <tr>
                            <td>Usuario:</td>
                            <td><input type="Text" name="nombre_usuario"></td>
                        </tr>
                        <tr>
                            <td>Contraseña:</td> 
                            <td><input type="Password" name="pass_usuario"></td>
                       </tr>
                        <tr>
                            <td><input type="submit" name="Ingresar" value="Iniciar Sesion"></td>
                        </tr>
                        <tr>
                            <td><a href="#">Olvidaste la contraseña?</a></td>
                            <td><a  id="reg" href="#">Registrate</a>
                        </tr>
                    </table>       
                  </form>
            </div>  
        </div>
        <!--fin formulario de iniciio de cesion-->
        <!--Contenido-->
        <div class="centro">
            <h1><a href =VerDetalleEquipos.jsp>Ver Equipos</a></h1>
        </div>
</body>
</html>