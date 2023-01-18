<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_diseño.WEB.Inicio" %>
<% 

    HttpContext context = HttpContext.Current;
    Boolean logueado = (Boolean)(context.Application["login"]);
    Boolean _admin = (Boolean)(context.Application["_admin"]);
    int ID_USER = (int)(context.Application["ID_USER"]);

    if (!logueado)
    {
        HttpContext.Current.Response.Redirect("../Index.apsx");
    }

    

%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Inicio</title>
		<!--CSS-->
		
		<link rel="stylesheet" href="../CSS/General.css" />
		<link rel="stylesheet" href="../CSS/Header.css" />
		<link rel="stylesheet" href="../CSS/Tema.css" />
		<link rel="stylesheet" href="../CSS/nuevoGeneral.css" />
		<link rel="stylesheet" href="../CSS/Inicio.css" />
		
		<!--Fonts-->
		
		<link href="Fonts/Kodchasan/Kodchasan-Regular.ttf" rel="stylesheet"/>
	</head>
	
	<body>
		<header id="header">
			<div class="">
				<div id="titulo_pagina">Inicio</div>
				<nav class="menu" data-animation="center">
					<a href="Inicio.aspx" id="link_inicio" class="">Inicio</a>
					<a href="Ajustes.aspx" id="link_ajustes">Ajustes</a>
					<a href="Admin.aspx" id="link_admin" class="<%if (!_admin) { Response.Write("hidden"); }%>">Admin</a>
				</nav>
			</div>
		</header>
		<div class="filtros caja_Default" id="btn_filtros"> filtros </div>
		<div class="div-cuerpo-tareas-tutorias">
			<div class="juegos" id="contenedor_juegos">
				<!--Inicia Juego-->
				<div class="juego hidden" id="contenedor_game">
					<form action="../Controlador/desplegar_juego.ashx" class="" id="form_juego">
						<div class="imagen_juego" id="img_juego">
							<img src="../Media/IMG/default_game.jpg" class="img_juego" onclick="submit()"/>
						</div>
						<input name="id_juego" id="id_juego" type="text" value="1" class="id_input hidden" />
						<div class="caja-padre ">
							<input type="submit" class="titulo_juego" value="Titulo" />
						</div>
					</form>
					<div class="caja-padre ">
						<div class="categoria_juego"></div>
					</div>
				</div>
				<!--Fin Juego-->
				
			</div>
		</div>
		
		
		<!--Pop UP-->
		<!--Filtros-->
    <div class="overlay oculto" id="overlay_filtro">
        <div class="popup">
            <form action="../Controlador/Filtros.ashx" class="form_popup" runat="server">

                		
				<label>Ordenar por</label>
				<select name="orden" id="orden" class="input">
					<option selected="selected" hidden="hidden" value="0">Selecione</option>
					<option value="0">Sin filtro</option>
					<option value="1">nombre</option>
					<option value="2">fecha</option>
					<option value="3">Categoria</option>
				</select>
				
				<label>Ver unicamente</label>
				<select name="tipo_vista" id="tipo_vista" class="input">
					<option selected="selected" hidden="hidden" value="0">Selecione</option>
					<option value="0">Sin filtro</option>
					<option value="1">Favoritos</option>
					<option value="2">No me gusta</option>
					<option value="3">Año</option>
					<option value="4">Plataforma</option>
					<option value="5">Categoria</option>
				</select>
				
				
                
				
				<!-- para year-->
                <asp:DropDownList ID="year" runat="server" DataSourceID="SqlData_Year" DataTextField="Column1" DataValueField="Column1" CssClass="input hidden"></asp:DropDownList>
				<asp:SqlDataSource runat="server" ID="SqlData_Year" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT DISTINCT  YEAR(lanzamiento) FROM [game] ORDER BY  YEAR(lanzamiento);"></asp:SqlDataSource>
                <!-- Para categoria -->
                <asp:DropDownList ID="categoria" runat="server" DataSourceID="SqlData_categoria" DataTextField="nombre" DataValueField="nombre" CssClass="input hidden"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlData_categoria" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [nombre] FROM [categoria]"></asp:SqlDataSource>

                <!-- para plataforma -->
                <asp:DropDownList ID="plataforma" runat="server" DataSourceID="SqlData_plataforma" DataTextField="nombre" DataValueField="nombre" CssClass="input hidden"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlData_plataforma" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [nombre] FROM [plataforma]"></asp:SqlDataSource>
                
				
				
				<div class="caja-padre">
                    <input type="submit" value="Aplicar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarGenero"/>
                    <input type="button" class="btn_submit_popup btn-cuenta-nueva btn-color-rojo" value="Cancelar" id="cancelar_filtro"/>
                </div>
            </form>
        </div>
    </div>
		
	</body>
	<script src="../JS/JQuery.js"></script>
	<script src="../JS/header.js"></script>
	<script src="../JS/Inicio.js"></script>
</html>
