<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="Clases.*, java.lang.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ibet</title>
        <style type="text/css">@import url("Estilo.css"); </style>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        
<link href="Estilo.css" rel="stylesheet" type="text/css" />
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
              <div id="estado_sesion"  ><h4>Bienvenido: <%out.print(session.getAttribute("username")); %>&nbsp;&nbsp; <a href="Perfil_Usuario.jsp">Editar Perfil</a>&nbsp;&nbsp;<a href="Logout.jsp">Cerrar Sesion</a></h4></div>
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
                                <div id="reloj">
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
                                </div>
                            </ul>
                        </div>
               </div>
        </div> 
     </div>
     </div>
    <!--fin Barra de menu-->
    <!--formulario de iniciio de cesion-->
     <%if(session.getAttribute("username")==null){
                
              %>
    <!--div id="transparente"-->    
    <div class="right">
            <div id="login" > 
               <form action="Login.jsp" method="POST">
                   <fieldset class="Inicio de Sesion">
                       <legend><b>Login</b></legend>
                            
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
                        <tr><td><input type="submit" value="Ingresar"></td></tr>
                            <td><a href="#">Olvidaste la contraseña?</a></td>
                            <td><a  id="reg" href="Registro_Usuario.jsp">Registrate</a>
                        </tr>
                    </table>  
                  </fieldset>
                  </form>
            </div>  
        </div> <%}%>  
        <!--/div-->
        <!--fin formulario de iniciio de cesion-->
        <!--Contenido-->
        <div class="centro">
            <h1><a href =VerDetalleEquipos.jsp>Probando VerDetalleEquipos</a></h1>
            </br>
            <h1><a href =DetalleJugadores.jsp>Probando VerDetalleJugadores</a></h1>
            <div id="datosUser">
            <%if(session.getAttribute("username")!=null){
                ResultSet usuario = ManejadorBD.getInstancia().getStatement().executeQuery("select * from usuarios where nick='"+session.getAttribute("username")+"'");
                while(usuario.next()){
                out.println("<h2>Usuario: "+usuario.getObject("nick")+"</h2></br>");
                out.println("<h2>Correo electronico: "+usuario.getObject("correo")+"</h2></br>");
                out.println("<h2>Saldo: $"+usuario.getObject("saldo")+"</h2></br>");
                out.println("<h2>Pais: "+usuario.getObject("pais")+"</h2></br>");
                out.println("<h2>Documento: "+usuario.getObject("nro_documento")+"</h2></br>");
                out.println("<h2>Telefono: "+usuario.getObject("telefono")+"</h2></br>");
                out.println("<h2>Direccion: "+usuario.getObject("direccion")+"</h2></br>");
                
                
                }
              }
            List lista = new ArrayList();
            lista = ManejadorBD.getInstancia().ObtenerFechaHora();
            
            int dia_resta=Integer.valueOf(lista.get(0).toString());
            int mes_resta=Integer.valueOf(lista.get(1).toString());
            int anio_resta=Integer.valueOf(lista.get(2).toString());
            int hora_resta=Integer.valueOf(lista.get(3).toString());
            int min_resta=Integer.valueOf(lista.get(4).toString());

            %>    
            </div>
        </div>
        <input type="hidden" id="h-resta" value="<%=hora_resta%>" />
        <input type="hidden" id="min-resta" value="<%=min_resta%>" />
        <input type="hidden" id="d-resta" value="<%=dia_resta%>" />
        <input type="hidden" id="mes-resta" value="<%=mes_resta%>" />
        <input type="hidden" id="a-resta" value="<%=anio_resta%>" />

</body>
</html>

			