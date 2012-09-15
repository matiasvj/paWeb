<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="Clases.*, java.lang.*"%><%/*importo las clases que estan en el paquete Clases.*/%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
<link href="Estilo.css" rel="stylesheet" type="text/css" />
<!--script src="funciones.js" type="text/javascript"></script-->
</head>

<body id="index" background ="fondo.jpg">
	
		<div id="main">
			<!--cabecera -->
			<div id="cabecera">
				<div class="cabecera_logo">
						<div class="left"><!--Se usa para posicionar el objeto dentro del div cabecera logo-->
					<img alt=""  src="pr_centro.png" /><br />
						</div>
					<div class="right">	</div>
					<div class="clear"></div>
				</div>
				<!--Barra de Menu-->
				<div id="menu">
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
				<!--fin de la Barra de Menu-->
		       </div>
                </div>
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
</body>
</html>