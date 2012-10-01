<%-- 
    Document   : DetalleJugador
    Created on : 23-sep-2012, 17:39:35
    Author     : Usaurio
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        
<link href="Estilo.css" rel="stylesheet">
        <title>Detalle Jugador</title>
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
					<a class="brand">Apuesta</a>
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
         <div class="container">
        <div class="centro">
            <table class="table table-bordered" >
        <%
            out.println("<h2>Detalle del jugador</h2>");
            String id = request.getParameter("cod");
            int ID = Integer.parseInt(id);
            ManejadorBD mbd = ManejadorBD.getInstancia();
            ResultSet eq = mbd.getStatement().executeQuery("select * from jugadores j, equipos e, jugadores_equipos je where id_jugador="+ID+" and jugador="+ID+" and id_equipos=equipo");
            while(eq.next()){
                out.println("<tr>");
                out.println("<td><a> Nombre: "+eq.getObject("j.nombre") +"</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Equipo: "+eq.getObject("e.nombre")+"</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Nombre completo: "+eq.getObject("nombrecompleto") +"</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Nacionalidad: "+eq.getObject("nacionalidad") +"</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Posicion: "+eq.getObject("posicion")+"</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Altura: "+eq.getObject("altura") +" m.</a></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><a> Peso: "+eq.getObject("peso") +" kg</a></td>");
                out.println("</tr>");
                
            }
            List lista = new ArrayList();
            lista = ManejadorBD.getInstancia().ObtenerFechaHora();
            
            int dia_resta=Integer.valueOf(lista.get(0).toString());
            int mes_resta=Integer.valueOf(lista.get(1).toString());
            int anio_resta=Integer.valueOf(lista.get(2).toString());
            int hora_resta=Integer.valueOf(lista.get(3).toString());
            int min_resta=Integer.valueOf(lista.get(4).toString());

              
            %>
            </table>
            </div>
         </div>
               <!--Contenido-->
       
        <input type="hidden" id="h-resta" value="<%=hora_resta%>" />
        <input type="hidden" id="min-resta" value="<%=min_resta%>" />
        <input type="hidden" id="d-resta" value="<%=dia_resta%>" />
        <input type="hidden" id="mes-resta" value="<%=mes_resta%>" />
        <input type="hidden" id="a-resta" value="<%=anio_resta%>" />

			
			<script src="http://code.jquery.com/jquery-latest.js"></script>
			<script src="funciones.js"></script>
			   
    </body>
</html>
