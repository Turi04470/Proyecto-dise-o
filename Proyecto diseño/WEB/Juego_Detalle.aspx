<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Juego_Detalle.aspx.cs" Inherits="Proyecto_diseño.Controlador.Juego_Detalle" %>

<% 


    HttpContext context = HttpContext.Current;
    Boolean logueado = (Boolean)(context.Application["login"]);
    Boolean _admin = (Boolean)(context.Application["_admin"]);



    if (!logueado )
    {
        HttpContext.Current.Response.Redirect("404.html");
    }




%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Juego</title>
    <!--CSS-->

    <link rel="stylesheet" href="../CSS/General.css" />
    <link rel="stylesheet" href="../CSS/Header.css" />
    <link rel="stylesheet" href="../CSS/Tema.css" />
    <link rel="stylesheet" href="../CSS/nuevoGeneral.css" />
    <link rel="stylesheet" href="../CSS/Detalle_Juego.css" />

    <!--Fonts-->

    <link href="Fonts/Kodchasan/Kodchasan-Regular.ttf" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,0" />
</head>

<body>
    <header id="header">
        <div class="">
            <div id="titulo_pagina">Inicio</div>

            <nav class="menu" data-animation="center">
                <a href="Inicio.aspx" id="link_inicio" class="">Inicio</a>
                <a href="" id="link_">Pagina</a>
                <a href="" id="link_">Pagina</a>
                <a href="" id="link_">Pagina</a>
                <a href="" id="link_">Pagina</a>
                <a href="Ajustes.aspx" id="link_ajustes">Ajustes</a>

                <a href="Admin.aspx" id="link_admin" class="<%if (!_admin) { Response.Write("hidden"); }%>">Admin</a>

            </nav>
        </div>
    </header>
    <div class="div-cuerpo">

        <!--Imagen del juego-->
        <div class="caja_Default" id="info_grafica">
            <div class="mascara_recorte" id="img_">
            </div>
        </div>

        <!--Datos del juego-->
        <div class="caja_Default" id="info_texto">
            <div>Titulo</div>
            <div id="Titulo">%titulo%</div>
            <div>Desarrolladora</div>
            <div id="Desarrolladora">%Desarrolladora%</div>
            <div>Lanzamiento</div>
            <div id="Lanzamiento">%Lanzamiento%</div>
            <div>Categoría</div>
            <div id="Categoria">%categoria%</div>
            <div>Plataforma</div>
            <div id="Plataforma">%Plataforma%</div>
            <div>Idioma</div>
            <div id="Idioma">%Idioma%</div>
        </div>

        <!--Requerimientos del juego-->
        <div class="caja_Default" id="info_requerimientos">
            <div class="Requerimientos" id="reque">Requerimientos</div>
            <div class="min_label" id="min">Minimos</div>
            <div class="max_label" id="max">Recomendados</div>
            <div class="min_requerimientos labels">
                <div>Procesador</div>
                <div id="min_procesador"></div>
                <div>Graficos</div>
                <div id="min_graficos"></div>
                <div>RAM</div>
                <div id="min_ram"></div>
                <div>SO</div>
                <div id="min_so"></div>
            </div>
            <div class="max_requereimientos labels">
                <div>Procesador</div>
                <div id="recomendado_procesador"></div>
                <div>Graficos</div>
                <div id="recomendado_graficos"></div>
                <div>RAM</div>
                <div id="recomendado_ram"></div>
                <div>SO</div>
                <div id="recomendado_so"></div>
            </div>
        </div>
        <!--Botones-->
       

        <div class="caja_Default <%if (!_admin) { Response.Write("hidden"); }%>" id="botonera">
            <div class="iconos" id="borrar">
                <span class="material-symbols-outlined">delete</span>
                <div>Borrar</div>
            </div>
            <br />
            <div class="iconos" id="editar">
                <span class="material-symbols-outlined">edit</span>
                <div>Editar</div>
            </div>
        </div>
        <!--Botones 2-->
        <div class="caja_Default" id="botonera2">
            <div class="iconos" id="fav">
                <span class="material-symbols-outlined">Favorite</span>
                <div>Favorito</div>
            </div>
            <br />
            <div class="iconos" id="nofav">
                <span class="material-symbols-outlined">thumb_down</span>
                <div>no me gusta</div>
            </div>
        </div>





    </div>
    
    <!-- 
			POP UPS
		 -->
    <div class="overlay oculto" id="overlay_opciones">
        <div class="popup">
            <div id="game">
                <span class="material-symbols-outlined">sports_esports</span>
                <div>Juego</div>
            </div>
            <div id="Requeriemientos">
                <span class="material-symbols-outlined">settings</span>
                <div>Requeriemientos</div>
            </div>
            <input type="button" value="Camcelar" class="btn_submit_popup btn-cuenta-nueva" id="Cancelar_popup" />
        </div>
    </div>




    <!--Juego-->
    <!--Agregar Juego-->
    <div class="overlay oculto" id="overlayJuego">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/Agregar_Game.ashx" class="form-tareas-agregar" runat="server" id="form_juego">

                <label>Nombre</label>
                <div class="error_input" hidden="hidden" id="error_juego">El nombre del juego ya existe</div>
                <input type="text" name="in_game" value="" id="in_game" required="required" placeholder="Nombe del juego" autocomplete="off" class="input_form" />


                <label>Desarrolladora</label>
                <asp:DropDownList ID="in_desarrolladora_juego" runat="server" DataSourceID="select_desarrolladora" DataTextField="nombre" DataValueField="id_desarrolLadora" class="input_form"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="select_desarrolladora" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [id_desarrolLadora], [nombre] FROM [desarrolladora] ORDER BY [nombre]"></asp:SqlDataSource>

                <label>Fecha de lanzamiento</label>
                <input type="date" name="in_lanzamiento" value="" id="in_lanzamiento" required="required" class="input_form" />

                <label>Categoria</label>
                <asp:DropDownList ID="in_categoria_juego" runat="server" DataSourceID="select_categoria" DataTextField="nombre" DataValueField="id_categoria" class="input_form"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="select_categoria" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [id_categoria], [nombre] FROM [categoria] ORDER BY [nombre]"></asp:SqlDataSource>


                <label>Plataforma</label>
                <asp:DropDownList ID="in_plataforma" runat="server" DataSourceID="lista_plataforma" DataTextField="nombre" DataValueField="id_plataforma" class="input_form"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="lista_plataforma" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [nombre], [id_plataforma] FROM [plataforma] ORDER BY [nombre]"></asp:SqlDataSource>

                <label>Idioma</label>
                <asp:DropDownList ID="in_idioma" runat="server" DataSourceID="lista_idioma" DataTextField="nombre" DataValueField="id_idioma" class="input_form"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="lista_idioma" ConnectionString='<%$ ConnectionStrings:VIDEOJUEGOSConnectionString %>' SelectCommand="SELECT [nombre], [id_idioma] FROM [idioma] ORDER BY [nombre]"></asp:SqlDataSource>

                <label>Imagen</label>
                <input type="text" name="in_img" value="" id="in_img" placeholder="Inserta URL de una imagen" autocomplete="off" class="input_form" />

                <div class="caja-padre">
                    <input type="submit" value="Actualizar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarJuego">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="CancelarJuego">
                </div>

            </form>
        </div>
    </div>


    <!--Requer-->
    <div class="overlay oculto" id="overlay_reque">
        <div class="popup-tareas-agregar scroll">
            <form action="../Controlador/Agregar_Reque.ashx" class="form-tareas-agregar" id="form_genero">


                <!--Minimos-->
                <label class="Requerimientos">Minimos</label>

                <label>Procesador</label>
                <input type="text" name="min_Procesador" value="" id="min_Procesador" required="required" autocomplete="off" class="input_form" />

                <label>Graficos</label>
                <input type="text" name="min_Graficos" value="" id="min_Graficos" required="required" autocomplete="off" class="input_form" />

                <label>RAM</label>
                <input type="text" name="min_RAM" value="" id="min_RAM" required="required" autocomplete="off" class="input_form" />

                <label>SO</label>
                <input type="text" name="min_SO" value="" id="min_SO" required="required" autocomplete="off" class="input_form" />

                <!--Maximos-->
                <label class="Requerimientos">Maximos</label>

                <label>Procesador</label>
                <input type="text" name="max_Procesador" value="" id="max_Procesador" required="required" autocomplete="off" class="input_form" />

                <label>Graficos</label>
                <input type="text" name="max_Graficos" value="" id="max_Graficos" required="required" autocomplete="off" class="input_form" />

                <label>RAM</label>
                <input type="text" name="max_RAM" value="" id="max_RAM" required="required" autocomplete="off" class="input_form" />

                <label>SO</label>
                <input type="text" name="max_SO" value="" id="max_SO" required="required" autocomplete="off" class="input_form" />



                <div class="caja-padre">
                    <input type="submit" value="Actualizar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarReque">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="CancelarReque">
                </div>
            </form>
        </div>
    </div>



</body>
<script src="../JS/JQuery.js" type="text/javascript"></script>
<script src="../JS/Detalle_Juego.js"></script>
<script src="../JS/header.js"></script>

<script>

    //Descativar tecla enter
    $(document).ready(function () {
        $("form").keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        });
    });

    <%
    ArrayList lista_juegos = (ArrayList)context.Session["lista_juegos"];

    %>


    //Arrays
    var lista_juegos = [];

    //Inputs
    var in_game = document.getElementById('in_game');

    //Labels de errror
    var error_juego = document.getElementById('error_juego');



    //Botones submit
    var AgregarJuego = document.getElementById('AgregarJuego');



    //Copiar array de ASP a JS
    <%for (int i = 0; i < lista_juegos.Count; i++)
    {%>
    lista_juegos.push("<%Response.Write(lista_juegos[i]);%>");

    <%}%>




    //Validacion del juego repetido
    in_game.addEventListener("DOMFocusOut", function () {
        var repetido = false;
        if (in_game.value === "") {
            //si esta vacio remueve color
            in_game.classList.remove("input_valid");
            in_game.classList.remove("input_invalid");
        } else {



            //Busca juego repetido
            for (var i = 0; i < lista_juegos.length; i++) {
                if (in_game.value === lista_juegos[i]) {
                    repetido = true;
                }
            }

            //si esta repetido agrega color y msg error
            if (repetido) {
                in_game.classList.remove("input_valid");
                in_game.classList.add("input_invalid");
                AgregarJuego.hidden = true;
                error_juego.hidden = false;


            } else {
                in_game.classList.remove("input_invalid");
                in_game.classList.add("input_valid");
                AgregarJuego.hidden = false;
                error_juego.hidden = true;


            }

        }

    });






</script>

</html>
