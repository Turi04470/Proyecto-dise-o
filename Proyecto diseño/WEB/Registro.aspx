<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Proyecto_diseño.WEB.Registro" %>

<% 

    HttpContext context = HttpContext.Current;

    Boolean registro_admin = (Boolean)(context.Application["registro_admin"]);
    int Existe_usuario = (int)(context.Application["Existe_usuario"]);
    int fallo_desconocido = (int)(context.Application["fallo_desconocido"]);
    int registro_exito = (int)(context.Application["registro_exito"]);



%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrarse</title>


    <!--CSS-->
    <link href="../CSS/Animaciones.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/General.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../CSS/Tema.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">


    <!--Fonts-->
    <link href="Fonts/helvetica-bold.otf" />
</head>
<body>


    <div class="caja-padre-inicio">

        <div class="div-descripcion ">
            <div class="titulo">Registrarse</div>
            <div><%if (registro_admin)
                     {%>Registrar un administrador <%}
        else
        { %>Bienvenido por favor registrate<%} %></div>

        </div>

        <div class="div-login-registro">
            <form class="form-login-registro" method="get" action="../Controlador/Registrar.ashx">

                <input name="correo_registro" type="email" required="required" class="input H55px" placeholder="Correo electrónico" value="" id="correo_registro" autocomplete="off">

                <input name="usuario_registro" type="text" required="required" class="input H55px" id="usuario_registro" placeholder="Nombre de Usuario" autocomplete="off">

                <input name="pass_registro" type="password" required="required" class="input H55px" id="pass_registro" placeholder="Contraseña" minlength="6" autocomplete="off">
                <hr class="separador">

                <input name="registrarse" type="submit" class="btn-iniciar-registrar animate__animated" id="registrarse" value="Registrarse" autocomplete="off">
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
        <!--<div class="Eslogan">Inovando la Nueva Era</div>-->
    </footer>





    <!--Fallo iniciar sesion-->
    <div class="overlay <%if (Existe_usuario==2) { Response.Write("oculto"); } else { context.Application["Existe_usuario"] = 2; }%>" id="overlaySesion">
        <div class="popup-tareas-agregar">

            <div class="alertaMSG">Ya existe el usuario</div>

            <div class="caja-padre">

                <input type="button" value="OK" class="btn_submit_popup btn-cuenta-nueva" id="OK">
            </div>

        </div>
    </div>



    <!--Registrado con exito-->
    <div class="overlay <%if (fallo_desconocido==2) { Response.Write("oculto"); context.Application["fallo_desconocido"] = 2; }%>" id="overlayRExito">
        <div class="popup-tareas-agregar">

            <div class="alertaMSG">No te has podido registrar fallo desconocido</div>



            <div class="caja-padre">

                <input type="button" value="OK" class="btn_submit_popup btn-cuenta-nueva" id="OK_R">
            </div>

        </div>
    </div>



</body>
<script src="../JS/JQuery.js"></script>
<script src="../JS/Genesis.js"></script>
<script src="../JS/Registro.js"></script>
</html>
