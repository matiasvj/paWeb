<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" import="Clases.*, java.lang.*"%>
<jsp:useBean id ="Reg" class ="Clases.Registro" scope="page">
<jsp:setProperty name="Registro" property="*"></jsp:setProperty> 
</jsp:useBean>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
<link href="Estilo.css" rel="stylesheet" type="text/css" />
<script src="funciones.js" type="text/javascript"></script>
</head>

<body  background="fondo.jpg">
    
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
             <FORM id="formulario" name="formulario" method="POST" action="Registro" class="formulario">
                 <table cellpadding="5" align="center" border="0">
                        <tr><td>
                                <table class="formulario">

                                        <tr align="left">
                                        <td>Nombre de Login:</td>
                                        <td><input  class="inputNormal" type="text"  name="login_usuario" id="login_usuario">
                                        <td class="ayuda">
                                            <img src="ayuda.gif" alt="Ayuda" onmouseover="muestraAyuda(event, 'login_usuario')">
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
                          %><jsp:forward page="error.jsp"/><%
                       } 
                  %>
</body>
</html>		