<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Proyecto_diseño.Index" %>

<%
    
    /*
    HttpContext context = HttpContext.Current;
    string firstName = (string)(context.Application["correo"]);
    Boolean logueado = (Boolean)(context.Application["login"]);
    int credenciales_incorrectos = (int)(context.Application["credenciales_incorrectos"]);
    int registro_exito = (int)(context.Application["registro_exito"]);

    if (logueado)
    {
        HttpContext.Current.Response.Redirect("WEB/Inicio.aspx");
    }

        */
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

            
        </form>


    </div>

</div>



</body>
<script src="../JS/JQuery.js"></script>

<script src="JS/Index.js"></script>


</html>