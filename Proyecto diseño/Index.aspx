<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Proyecto_diseño.Index" %>

<%
    HttpContext context = HttpContext.Current;
    string firstName = (string)(context.Application["correo"]);
    Boolean logueado = (Boolean)(context.Application["login"]);
    int credenciales_incorrectos = (int)(context.Application["credenciales_incorrectos"]);
    int registro_exito = (int)(context.Application["registro_exito"]);

    if (logueado)
    {
        HttpContext.Current.Response.Redirect("WEB/Inicio.aspx");
    }


%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>


    <!--CSS-->
    <link rel="stylesheet" href="CSS/General.css"/>
    <link rel="stylesheet" href="CSS/Index.css"/>
    <link rel="stylesheet" href="CSS/Tema.css"/>
    <link rel="stylesheet" href="CSS/Animaciones.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>


    <!--Fonts-->
    <link href="Fonts/helvetica-bold.otf" rel="stylesheet"/>
    <link href="Fonts/Kodchasan/Kodchasan-Regular.ttf" rel="stylesheet"/>


</head>
<body>


<div class="caja-padre-inicio">
    <div class="div-descripcion ">
        <div class="titulo">INICIO</div>
        <div>Inicia sesion</div>

    </div>

    <div class="div-login-registro">
        <!--inicia formulario-->
        <form action="Controlador/Iniciar_Sesion.ashx" id="form_iniciar" class="form-login-registro" method="get">

            <input name="correo_login" type="email" required="required" class="input H55px" id="correo_login" placeholder="Correo electrónico" value=""/>


            <input name="pass_login" type="password" required="required" class="input H55px" id="pass_login" placeholder="Contraseña" minlength="5"/>
            <hr class="separador"/>

            <input name="iniciar" type="submit" class="btn-iniciar-registrar animate__animated" id="iniciar" value="Iniciar Sesión"/>

            <input name="btn_crear_cuenta" type="button" class="btn-cuenta-nueva animate__animated" id="btn_crear_cuenta" value="Crear cuenta nueva" onclick="location.href = 'WEB/Registro.aspx'"/>
        </form>


    </div>

</div>
<footer class="foter">
    <div class="Genesis-tilte">
        <div class="G opacity" id="g">G</div>
        &nbsp;&nbsp;
        <div class="E opacity" id="e">E</div>
        &nbsp;&nbsp;
        <div class="N opacity" id="n">N</div>
        &nbsp;&nbsp;
        <div class="EE opacity" id="ee">E</div>
        &nbsp;&nbsp;
        <div class="S opacity" id="s">S</div>
        &nbsp;&nbsp;
        <div class="I opacity" id="i">I</div>
        &nbsp;&nbsp;
        <div class="SS opacity" id="ss">S</div>
    </div>
    <!-- <div class="Eslogan" id="del">Inovando la Nueva Era</div>-->
</footer>


<!--Fallo iniciar sesion-->
<div class="overlay <% if (credenciales_incorrectos == 2) { Response.Write("oculto"); } else {context.Application["credenciales_incorrectos"] = 2; } %>" id="overlaySesion">
    <div class="popup-tareas-agregar">

        <div class="alertaMSG">Credenciales incorrectos intente otra vez</div>


        <div class="caja-padre">

            <input type="button" value="OK" class="btn_submit_popup btn-cuenta-nueva" id="OK"/>
        </div>

    </div>
</div>


<!--Registrado con exito-->
<div class="overlay <% if (registro_exito == 2) { Response.Write("oculto"); } else { context.Application["registro_exito"] = 2; } %>" id="overlayRExito">
    <div class="popup-tareas-agregar">

        <div class="alertaMSG">Te has Registrado con exito</div>


        <div class="caja-padre">

            <input type="button" value="OK" class="btn_submit_popup btn-cuenta-nueva" id="OK_R"/>
        </div>

    </div>
</div>


</body>
<script src="../JS/JQuery.js"></script>
<script src="JS/Genesis.js"></script>
<script src="JS/Index.js"></script>


</html>