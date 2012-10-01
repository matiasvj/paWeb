<%@page import="Clases.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        
<link href="Estilo.css" rel="stylesheet">
        <style type="text/css">@import url("Estilo.css"); </style>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
       
    </head>
    <body>
        <img id="bg" src="fondo.jpg" alt="Fondo" />
			<div class="navbar navbar-fixed-top">
			
			<!--Barra de Menu-->	
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
					<a class="brand" >Apuesta</a>
					<div class="nav-collapse">
				<ul class="nav">
					<li class="active"><a href="index.jsp"><i class="icon-home icon-white"></i>Inicio</a></li>
					  <li><a href="#">Usuario</a></li>
					  <li><a href="Competiciones.jsp">Competiciones</a></li>
					  <li><a href="#">Partidos</a></li>
                                          <li><div id="reloj">
                                <script language="javascript">
                                function muestraReloj() {
                                var fechaHora = new Date();
                                var hora_resta = parseInt(document.getElementById("h-resta").value);
                                var min_resta = parseInt(document.getElementById("min-resta").value);
                                var dia_resta = parseInt(document.getElementById("d-resta").value);
                                var mes_resta = parseInt(document.getElementById("mes-resta").value);
                                var anio_resta = parseInt(document.getElementById("a-resta").value);
                                
                                var horas = parseInt(fechaHora.getHours()+hora_resta);
                                var minutos = parseInt(fechaHora.getMinutes()+min_resta);
                                var segundos = parseInt(fechaHora.getSeconds());
                                var dia = parseInt(fechaHora.getDate()+dia_resta);
                                var mes = parseInt(fechaHora.getMonth()+1 + mes_resta);
                                var anio = parseInt(fechaHora.getYear()+1900+anio_resta);

                                
                                if(minutos<0)
                                {
                                    minutos=minutos+60;
                                    horas=horas-1;
                                }
                                if(horas<0)
                                {
                                    horas= horas+24;
                                    dia=dia-1;
                                }
                                if(dia<1)
                                {
                                    mes=mes-1;
                                    if(mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12)
                                    {
                                        dia=dia+31;
                                    }
                                    if(mes==2)
                                    {
                                        dia=dia+29;
                                    }
                                    if(mes==4 || mes==6 || mes==9 || mes==11)
                                    {
                                        dia=dia+30;
                                    }
                                }
                                if(mes<1)
                                {
                                    mes=mes+12;
                                    anio=anio-1;
                                }

 
                                if(horas < 10) { horas = '0' + horas; }
                                if(minutos < 10) { minutos = '0' + minutos; }
                                if(segundos < 10) { segundos = '0' + segundos; }
                                
                                document.getElementById("reloj").innerHTML = '<font size="2" face="Arial"><B>' + horas+':'+minutos+':'+segundos+"\n "+dia+"/"+mes+"/"+anio;
                                }

                                window.onload = function() {
                                  setInterval(muestraReloj, 1000);
                                } 
                                </script>
                                </div></li>
				</ul>
                                <%if(session.getAttribute("username")!=null){ %>
                                <ul class="nav pull-right">
                                    <li>Bienvenido: <%out.print(session.getAttribute("username")); %></li>
                                    <li><a href="Perfil_Usuario.jsp">Editar Perfil</a></li>
                                    <li><a href="Logout.jsp">Cerrar Sesion</a></li>
                                </ul>
                                <%}%>  
				<% if(session.getAttribute("username")==null){%> 
                                <ul class="nav pull-right">
				  <li><a href="Registro_Usuario.jsp">Registrarse</a></li>
					<li class="divider-vertical"></li>
					<li class="dropdown">
					<a class="dropdown-toggle" href="#" data-toggle="dropdown">Iniciar Sesion <strong class="caret"></strong></a>
					<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
					  <form action="Login.jsp" method="POST">
						  <label>Usuario:</label><input type="Text" name="nombre_usuario">
						  <label>Contraseña:</label><input type="Password" name="pass_usuario">
						  <input type="submit" class="btn" value="Ingresar">
					<a href="#">Olvidaste la contraseña?</a>
				</form>
				</div> <% } %>
				
                               </div>
			</div>
		  </div>
		</div>
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
                <td>Nombre de Usuario:</td><td><input type="text" name=edit_nombre_usuario></td>
                 
             </tr>   
            </table>
        </div>
    </body>
</html>
