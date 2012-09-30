<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" import="Clases.*, java.lang.*"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
<link href="Estilo.css" rel="stylesheet" type="text/css" />
<script src="funciones.js" type="text/javascript"></script>
 <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript">
                function verificar(login_usuario)
            { 
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                 xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("resultau").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","newjsp.jsp?q="+login_usuario,true);
                xmlhttp.send();
            }
            </script>
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
    <!--fin Barra de menu-->
    
        <!--Contenido-->
        <div class="container">
        <div class="centro">
           <% if(session.getAttribute("username")==null){
                 if(request.getParameter("login_usuario") == null && 
                         request.getParameter("correo_usuario") == null && 
                         request.getParameter("contrasenia_usuario")== null &&
                         request.getParameter("r_contrasenia_usuario") == null &&
                         request.getParameter("sexo_usuario") == null &&
                         request.getParameter("pais_usuario") == null) {
                                         
              %>
           <fieldset>
             <legend><b>Registro de Usuario</b></legend>
             <FORM class="form-horizontal" id="formulario" name="formulario" method="POST" action="Validar.jsp" >
                 <table cellpadding="5" align="center" border="0">
                        <tr><td>
                                <table class="formulario">

                                        <tr align="left">
                                        <td>Nombre de Login:</td>
                                        <td><input  class="inputNormal" type="text"  name="login_usuario" id="login_usuario" onkeyup="verificar(login_usuario.value)" >
                                        <td class="ayuda">
                                            <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'login_usuario')">
                                             <div id="resultau">
            
                                             </div>
                                        </td>
                                        </tr> 

                                        <tr align="left">
                                        <td>E-mail:</td>
                                        <td><input class="inputNormal" type="text" name="email_usuario" id="email_usuario">
                                        <td class="ayuda">
                                            <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'email_usuario')">
                                        </td></tr>

                                        <tr align="left">
                                        <td>Contraseña:</td>
                                        <td><input  class="inputNormal" type="text" name="contrasenia_usuario" id="contrasenia_usuario">
                                        <td class="ayuda">
                                            <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'contrasenia_usuario')">
                                        </td>
                                        </tr>

                                        <tr align="left">
                                            <td>Repetir Contraseña:</td>
                                            <td><input type="text" class="inputNormal" name="r_contrasenia_usuario" id="r_contrasenia_usuario"  >
                                        <td class="ayuda">
                                            <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'r_contrasenia_usuario')">
                                        </td>  
                                       </tr>

                                        <tr align="left"><td>Sexo:</td>
                                            <td><select name="sexo_usuario" id="sexo_usuario">
                                                <option value="seleccione" selected>*Seleccione*</option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                        </select></td></tr>

                                        <tr align="left"><td>Fecha de Nacim.:</td><td><input type="text" name="nacimiento_usuario" id="nacimiento_usuario"  maxlength="10">
                                        <td class="ayuda">
                                                <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'nacimiento_usuario')">
                                        </td></tr>
                                        <tr align="left"><td>País:</td><td><input type="text" name="pais_usuario" id="pais_usuario"  maxlength="50"></td></tr>
                                        </table>
				</td></tr>
		<tr>
                    <td colspan="2">
                            <table align="center">
                                     <tr>	
                                        <td width="60"></td>
                                        <td>
                                            <button  name="boton_confirmar" id="boton_confirmar"   type="submit">Confirmar</button>   
                                            
                                        </td>
                                    </tr>
                            </table>
                    </td>
                </tr>
            </table>
        </FORM>
        </div><%}
                                          }                  
                                            else{
                          %><script>alert("Ya ha iniciado una sesion, Intente mas tarde");
                            window.location.href='index.jsp';</script>
                      <% }   %>
        </div>
</body>
</html>		