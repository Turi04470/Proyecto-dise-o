<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajustes.aspx.cs" Inherits="Proyecto_diseño.WEB.WebForm1" %>

<% 

    HttpContext context = HttpContext.Current;
    Boolean logueado = (Boolean)(context.Application["login"]);
    Boolean _admin = (Boolean)(context.Application["_admin"]);
    int ID_USER = (int)(context.Application["ID_USER"]);

    if (!logueado)
    {
        HttpContext.Current.Response.Redirect("../Index.aspx");
    }


%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!--CSS-->

    <link rel="stylesheet" href="../CSS/General.css" />
    <link rel="stylesheet" href="../CSS/Header.css"/>
    <link rel="stylesheet" href="../CSS/Tema.css"/>
    <link rel="stylesheet" href="../CSS/nuevoGeneral.css"/>
    <link rel="stylesheet" href="../CSS/Ajustes.css"/>

    <!--Fonts-->

    <link href="Fonts/Kodchasan/Kodchasan-Regular.ttf" rel="stylesheet"/>



</head>

<body>
    <header id="header">
			<div class="">
				<div id="titulo_pagina">Ajustes</div>
				<nav class="menu" data-animation="center">
					<a href="Inicio.aspx" id="link_inicio" class="">Inicio</a>
					<a href="Ajustes.aspx" id="link_ajustes">Ajustes</a>
					<a href="Admin.aspx" id="link_admin" class="<%if (!_admin) { Response.Write("hidden"); }%>">Admin</a>
				</nav>
			</div>
		</header>




    <div class="div-cuerpo">

        <div class="caja_Default informacion_cuenta">
            <div class="titulos">Informacion de la cuenta</div>
            <div class="tablita">
                <div class="etiquetas">

                    <div>Nombre</div>
                    <div>correo</div>
                    <div>edad</div>
                </div>
                <div class="datos">

                    <div id="user_nombre"></div>
                    <div id="user_correo"></div>
                    <div id="user_edad"></div>
                </div>
            </div>
            <div class="caja-padre">

                <input type="button" class="btn_submit_popup btn-cuenta-nueva btnCambiar" value="Cambiar" id="bntCambiarInfoCuenta"/>
            </div>

        </div>

        <div class="caja_Default computadora">
            <div class="titulos">Computadora</div>
            <div class="tablita2">
                <div class="etiquetas">
                    <div>procesador</div>
                    <div>RAM</div>
                    <div>Graficos</div>
                    <div>so</div>
                </div>
                <div class="datos">
                    <div id="pc_procesador">datos</div>
                    <div id="pc_ram">datos</div>
                    <div id="pc_graficos">datos</div>
                    <div id="pc_so">datos</div>
                </div>
            </div>
            <div class="caja-padre">

                <input type="button" class="btn_submit_popup btn-cuenta-nueva btnCambiar" value="Cambiar" id="btnCambiarPC"/>
            </div>
        </div>

        <div class="caja_Default sesion">
            <div class="cerrarSesion">Cerrar sesion</div>
            <form action="../Controlador/Cerrar_Sesiont.ashx" class="caja-padre" id="form_logout">

                <svg class="svg" id="logout">
                    <path d="M24 26.1q-1 0-1.675-.675t-.675-1.675V6.9q0-1 .675-1.7T24 4.5q1 0 1.675.7t.675 1.7v16.85q0 1-.675 1.675T24 26.1Zm0 17.25q-4 0-7.5-1.5t-6.125-4.125Q7.75 35.1 6.25 31.6t-1.5-7.5q0-3.5 1.25-6.725Q7.25 14.15 9.6 11.6q.65-.8 1.7-.9 1.05-.1 1.85.6.7.7.675 1.675-.025.975-.625 1.725-1.75 1.95-2.75 4.35-1 2.4-1 5.05 0 6.05 4.25 10.3 4.25 4.25 10.3 4.25 6.05 0 10.3-4.25 4.25-4.25 4.25-10.3 0-2.65-.975-5.05T34.85 14.7q-.6-.8-.6-1.775 0-.975.7-1.625.8-.75 1.875-.6 1.075.15 1.825 1 2.25 2.55 3.45 5.75 1.2 3.2 1.2 6.65 0 4-1.525 7.5t-4.15 6.125Q35 40.35 31.5 41.85t-7.5 1.5Z" />

                </svg>
            </form>



        </div>





    </div>


    <!--POP UPS-->


    <!--Editar cuenta-->
    <div class="overlay oculto" id="overlayEditarCuenta">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/ModificarCuenta.ashx" class="form-tareas-agregar">
                <!--Oculto-->
                <input type="text" name="id_userCuenta" id="id_userCuenta" value="<%Response.Write(ID_USER);%>" hidden="" />
                <label>Nombre</label>
                <input name="nombre" type="text" required="required" autocomvplete="off" id="nombre" class="input_form"/>

                <label>Correo </label>
                <input type="email" required="required" autocomplete="off" id="correo" name="correo"  class="input_form"/>

                <label>Edad</label>
                <input type="number" required="required" autocomplete="off" id="edad" name="edad"  class="input_form"/>

                <div class="caja-padre">
                    <input type="submit" value="Actualizar" class="btn_submit_popup btn-cuenta-nueva" id="btnUpdateCuenta" />
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="cancelarUpdateCuenta" />
                </div>
            </form>
        </div>
    </div>



    <!--Editar PC-->
    <div class="overlay oculto" id="overlayEditarPC">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/ModificarPC.ashx" class="form-tareas-agregar">
                <!--Oculto-->
                <input type="text" name="id_userPC" id="id_userPC" value="<%Response.Write(ID_USER);%>" hidden="" />
                <label>Procesador</label>
                <input name="procesador" id="procesador" type="text" required="required" autocomplete="off"  class="input_form"/>

                <label>RAM</label>
                <input name="ram" id="ram" type="text" required="required" autocomplete="off"  class="input_form"/>

                <label>Graficos</label>
                <input name="graficos" id="graficos" type="text" required="required" autocomplete="off"  class="input_form"/>

                <label>SO</label>
                <select name="SO" id="SO" class="input_form">
                    <option value="Windows 7">Windows 7</option>
                    <option value="Windows 8">Windows 8</option>
                    <option value="Windows 8.1">Windows 8.1</option>
                    <option value="Windows 10">Windows 10</option>
                    <option value="Windows 11">Windows 11</option>
                    <option value="MAC OS">MAC OS</option>
                    <option value="Linux">Linux</option>
                </select>

                <div class="caja-padre">
                    <input type="submit" value="Actualizar" class="btn_submit_popup btn-cuenta-nueva" id="btnUpdatePC"/>
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="cancelarUpdatePC"/>
                </div>
            </form>
        </div>
    </div>

</body>
<script src="../JS/JQuery.js"></script>
<script src="../JS/header.js"></script>
<script src="../JS/Ajustes.js"></script>

</html>
