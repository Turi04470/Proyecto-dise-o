<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Proyecto_diseño.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>


    <!--CSS-->
    <link rel="stylesheet" href="CSS/General.css" />
    <link rel="stylesheet" href="CSS/Index.css" />
    <link rel="stylesheet" href="CSS/Tema.css">
    <link rel="stylesheet" href="CSS/Animaciones.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">


    <!--Fonts-->
    <link href="Fonts/helvetica-bold.otf" />


</head>
<body>


    <div class="caja-padre-inicio">
        <div class="div-descripcion ">
            <div class="titulo">Inicio</div>
            <div>Una aplicacion que te ayude a administrar</div>

        </div>

        <div class="div-login-registro">
            <!--inicia formulario-->
            <form action="Controlador/Iniciar_Sesion.ashx" id="form_iniciar" class="form-login-registro" method="get">

                <input name="correo_login" type="email" required="required" class="input H55px" id="correo_login" placeholder="Correo electrónico" value="" />


                <input name="pass_login" type="password" required="required" class="input H55px" id="pass_login" placeholder="Contraseña" minlength="6">
                <hr class="separador">

                <input name="iniciar" type="submit" class="btn-iniciar-registrar animate__animated" id="iniciar" value="Iniciar Sesión">

                <input name="btn_crear_cuenta" type="button" class="btn-cuenta-nueva animate__animated" id="btn_crear_cuenta" value="Crear cuenta nueva" onclick="location.href = 'WEB/Registro.html'">
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
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="JS/Genesis.js"></script>
<script src="JS/Index.js"></script>
</html>
