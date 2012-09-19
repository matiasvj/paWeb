// Mensajes de ayuda
onload=function() 
{
    cAyuda=document.getElementById("mensajesAyuda");
    cNombre=document.getElementById("ayudaTitulo");
    cTex=document.getElementById("ayudaTexto");
    form=document.getElementById("formulario");
    ayuda=new Array();
    ayuda["Usuario"]="Ingresa tu nombre. De 4 a 50 caracteres. OBLIGATORIO";
    ayuda["Correo Electronico"]="Ingresa un e-mail válido. OBLIGATORIO";
    ayuda["Password"]="Ingresa un contrasenia. De 4 a 50 caracteres. OBLIGATORIO";
    ayuda["Repetir Password"]="Ingresa un contrasenia. De 4 a 50 caracteres. OBLIGATORIO";
    ayuda["Fecha de nacimiento"]="Ingresa una fecha. Formato dd/mm/aa o aa/mm/dd.";
}
if(navigator.userAgent.indexOf("MSIE")>=0) navegador=0;
else navegador=1;

function colocaAyuda(event)
{
	if(navegador==0)
	{
		var corX=window.event.clientX+document.documentElement.scrollLeft;
		var corY=window.event.clientY+document.documentElement.scrollTop;
	}
	else
	{
		var corX=event.clientX+window.scrollX;
		var corY=event.clientY+window.scrollY;
	}
	cAyuda.style.top=corY+20+"px";
	cAyuda.style.left=corX+15+"px";
}

function ocultaAyuda()
{
	cAyuda.style.display="none";
	if(navegador==0) 
	{
		document.detachEvent("onmousemove", colocaAyuda);
		document.detachEvent("onmouseout", ocultaAyuda);
	}
	else 
	{
		document.removeEventListener("mousemove", colocaAyuda, true);
		document.removeEventListener("mouseout", ocultaAyuda, true);
	}
}

function muestraAyuda(event, campo)
{
	colocaAyuda(event);
	
	if(navegador==0) 
	{ 
		document.attachEvent("onmousemove", colocaAyuda); 
		document.attachEvent("onmouseout", ocultaAyuda); 
	}
	else 
	{
		document.addEventListener("mousemove", colocaAyuda, true);
		document.addEventListener("mouseout", ocultaAyuda, true);
	}
	
	cNombre.innerHTML=campo;
	cTex.innerHTML=ayuda[campo];
	cAyuda.style.display="block";
}