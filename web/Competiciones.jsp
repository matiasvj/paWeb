<%@page import="java.util.ArrayList"%>
<%@page language="java" import="Clases.*, java.lang.*"%><%/*importo las clases que estan en el paquete Clases.*/%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Detalle de Equipos</title>
        <style type="text/css">@import url("Estilo.css"); </style>  
    </head>
    <body id="index" background ="fondo.jpg">
        
            
		<div id="main">
			<!--cabecera -->
			<div id="cabecera">
				<div class="cabecera_logo">
                                    <div class="left"><!--Se usa para posicionar el objeto dentro del div cabecera logo-->
					<img alt=""  src="pr_centro.png" /><br />
						</div>
        <form>
            <table  >
                 <div >
                    <tr>
                    <td>Id Equipo</td>
                        <td>Nombre</td>
                    </tr>
                   <%
                        ArrayList<Equipos> lista = ManejadorBD.getInstancia().VerDetalleEquipos();
                        for (int i=0;i<lista.size();i++)
                        {
                           out.println("<tr>");
                           out.println("<td><a href=http://www.google.com.uy>"+lista.get(i).getID()+"</a></td>");
                           out.println("<td>"+lista.get(i).getNombre()+"</td>");
                           out.println("</tr>");
                          }
                    /*El arraylist se completa con los datos obtenidos en la consulta. Para eso necesitamos importar */    
                    %> 
                    </div>
                    </div>
                        </div>
             </table>
        </form>
                     
    </body>
</html>
