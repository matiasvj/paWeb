<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="Clases.*, java.lang.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        

<link href="Estilo.css" rel="stylesheet" type="text/css" />
<!--script src="funciones.js" type="text/javascript"></script-->
</head>

<body >
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
    
        <!--Contenido-->
        <div class="container">
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
            <h4>Jugadores</h4>
            <table>
                <%
                ResultSet jugadores= mbd.VerJugadoresEquipo(ID);
                if (jugadores.first()){
                    out.println("<tr>");
                    out.println("<td>"+jugadores.getObject("jugadores.nombrecompleto") +"</td>");
                    out.println("</tr>");
                    while(jugadores.next()){
                    out.println("<tr>");
                    out.println("<td>"+jugadores.getObject("nombrecompleto") +"</td>");
                    out.println("</tr>");
                                       }
                }
                %>
            </table>
            <form method="POST" action="DetalleJugador.jsp.jsp">   
            <table>
                <%
                //tabla con links a detalle de jugador
                try{
                    ResultSet jugador= mbd.VerJugadoresEquipo(ID);
                    if (jugador.first()){
                        out.println("<tr>");
                        out.println("<td><a href=DetalleJugador.jsp?cod="+jugador.getObject("id_jugador")+">"+jugador.getObject("nombrecompleto")+"</a></td>");
                        out.println("</tr>");
                        while(jugador.next()){
                            out.println("<tr>");
                            out.println("<td><a href=DetalleJugador.jsp?cod="+jugador.getObject("id_jugador")+">"+jugador.getObject("nombrecompleto")+"</a></td>");
                            out.println("</tr>");
                        }
                    }else{
                        out.println("<h2>Este equipo aun no tiene jugadores asignados</h2>");
                    }
                } catch(Exception ex){
                    out.println("<h2>error en la consulta de jugadores</h2>");
                }
                %>
            </table>
        </div>
      </div>
</body>
</html>