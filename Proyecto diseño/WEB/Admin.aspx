<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Proyecto_diseño.WEB.Admin" %>

<% 


    HttpContext context = HttpContext.Current;
    Boolean logueado = (Boolean)(context.Application["login"]);
    Boolean _admin = (Boolean)(context.Application["_admin"]);
    int ID_USER = (int)(context.Application["ID_USER"]);

    

    if (!logueado || !_admin)
    {
        HttpContext.Current.Response.Redirect("404.html");
    }
    



%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--CSS-->

    <link rel="stylesheet" href="../CSS/General.css" />
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/Tema.css">
    <link rel="stylesheet" href="../CSS/nuevoGeneral.css">
    <link rel="stylesheet" href="../CSS/Admin.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />

    <!--Fonts-->

    <link href="Fonts/Kodchasan/Kodchasan-Regular.ttf" />
</head>

<body>
    <header id="header">
        <div class="">
            <div id="titulo_pagina">Admin</div>

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
        <div class="caja_Default informacion">
            <div class="titulos">Informacion</div>
            <div class="detalles">
                <div id="juegos"></div>
                <div>Juegos</div>
                <div id="categorias"></div>
                <div>Categarias</div>
                <div id="generos"></div>
                <div>generos</div>
                <div id="desarrolladoras"></div>
                <div>desarrolladoras</div>
            </div>
        </div>
        <div class="caja_Default juego" id="game_icon">
            <div class="titulos">Agregar juego</div>
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40">
                <path d="M7.875 33.333q-2.625 0-4.333-1.833-1.709-1.833-1.792-4.292 0-.333.042-.75.041-.416.125-.75l3.5-14Q6 9.5 7.812 8.083q1.813-1.416 4.063-1.416h16.25q2.25 0 4.063 1.416Q34 9.5 34.583 11.708l3.5 14q.084.375.146.771.063.396.063.771 0 2.5-1.771 4.292-1.771 1.791-4.396 1.791-1.75 0-3.25-.916-1.5-.917-2.25-2.5L25.458 27.5q-.208-.458-.604-.646-.396-.187-.896-.187h-7.916q-.5 0-.896.187-.396.188-.604.646l-1.167 2.417q-.75 1.583-2.25 2.5-1.5.916-3.25.916ZM8 30.542q.875 0 1.646-.438.771-.437 1.271-1.396l1.166-2.375q.584-1.166 1.625-1.812 1.042-.646 2.334-.646h7.916q1.25 0 2.313.667 1.062.666 1.687 1.791l1.167 2.375q.5.959 1.292 1.396.791.438 1.625.438 1.291 0 2.333-.896 1.042-.896 1.083-2.354v-.459q0-.25-.083-.458l-3.5-13.958q-.333-1.334-1.354-2.146-1.021-.813-2.396-.813h-16.25q-1.333 0-2.375.813-1.042.812-1.375 2.146l-3.5 13.958q-.042.167-.083.875 0 1.458 1.083 2.375T8 30.542Zm14.5-12.5q-.583 0-.979-.396t-.396-.979q0-.584.396-.979.396-.396.979-.396t.979.396q.396.395.396.979 0 .583-.396.979t-.979.396Zm3.333-3.334q-.583 0-.979-.395-.396-.396-.396-.98 0-.583.396-.979t.979-.396q.584 0 .979.396.396.396.396.979 0 .584-.396.98-.395.395-.979.395Zm0 6.667q-.583 0-.979-.396T24.458 20q0-.583.396-.979t.979-.396q.584 0 .979.396.396.396.396.979t-.396.979q-.395.396-.979.396Zm3.334-3.333q-.584 0-.979-.396-.396-.396-.396-.979 0-.584.396-.979.395-.396.979-.396.583 0 .979.396.396.395.396.979 0 .583-.396.979t-.979.396Zm-15 2.666q-.459 0-.792-.333t-.333-.792v-1.791H11.25q-.458 0-.792-.334-.333-.333-.333-.791 0-.459.333-.792.334-.333.792-.333h1.792V13.75q0-.458.333-.792.333-.333.792-.333.458 0 .791.333.334.334.334.792v1.792h1.791q.459 0 .792.333t.333.792q0 .458-.333.791-.333.334-.792.334h-1.791v1.791q0 .459-.334.792-.333.333-.791.333Z" />
            </svg>
        </div>
        <div class="caja_Default categoria" id="categoria_icon">
            <div class="titulos">Agregar Categoria</div>
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40">
                <path d="M8.333 35V7.625q0-1.125.834-1.937.833-.813 1.958-.813h17.75q1.125 0 1.958.813.834.812.834 1.937V35L20 30Z" />
            </svg>
        </div>
        <div class="caja_Default desarrolladora" id="desarrolladora_icon">
            <div class="titulos">Agregar desarrolladora</div>
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40">
                <path d="M14.333 27.667 6.667 20l7.666-7.667 1.959 2.042L10.625 20l5.667 5.625Zm-6 1.041h2.792v2.667h17.75v-2.667h2.792v6.834q0 1.125-.834 1.958-.833.833-1.958.833h-17.75q-1.125 0-1.958-.833-.834-.833-.834-1.958Zm2.792-17.75H8.333v-6.5q0-1.125.834-1.958.833-.833 1.958-.833h17.75q1.125 0 1.958.833.834.833.834 1.958v6.5h-2.792V8.625h-17.75Zm14.542 16.709-1.959-2.042L29.375 20l-5.667-5.625 1.959-2.042L33.333 20Z" />
            </svg>
        </div>
        <div class="caja_Default genero" id="genero_icon">
            <div class="titulos">Agregar genero</div>
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40">
                <path d="m10.875 18.167 9.167-14.834 9.166 14.834Zm18.458 18.5q-3.083 0-5.208-2.146T22 29.333q0-3.041 2.146-5.187Q26.292 22 29.333 22q3.042 0 5.188 2.146t2.146 5.187q0 3.084-2.146 5.209-2.146 2.125-5.188 2.125ZM5 35.708V22.792h12.875v12.916Z" />
            </svg>
        </div>
        <div class="caja_Default administrador">
            <div class="titulos">Registar Administrador</div>
            <form action="../Controlador/Permitir_registro_admin.ashx" id="newAdmin">
                <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" id="administrador_icon">
                    <path d="m27.417 35-.459-2.667q-.625-.208-1.25-.541-.625-.334-1.125-.792l-2.333.583L21 29.458l1.958-1.75q-.083-.458-.083-1.062 0-.604.083-1.063L21 23.792l1.25-2.084 2.333.584q.5-.459 1.125-.792t1.25-.542l.459-2.666h2.625l.416 2.666q.667.209 1.292.542.625.333 1.125.792l2.333-.584 1.25 2.125-1.958 1.792q.083.417.083 1.042t-.083 1.041l1.958 1.75-1.25 2.125L32.875 31q-.5.458-1.125.792-.625.333-1.292.541L30.042 35ZM3.333 33.208v-4.166q0-1.417.729-2.604.73-1.188 2.063-1.813 2.708-1.25 5.292-1.875 2.583-.625 5.25-.625h1q-1 2.417-.875 5.729.125 3.313 1.625 5.354Zm25.375-3.25q1.459 0 2.396-.937.938-.938.938-2.396t-.938-2.396q-.937-.937-2.396-.937-1.458 0-2.396.937-.937.938-.937 2.396t.937 2.396q.938.937 2.396.937ZM16.667 19.875q-2.75 0-4.563-1.833-1.812-1.834-1.812-4.584 0-2.75 1.812-4.562 1.813-1.813 4.563-1.813t4.562 1.813q1.813 1.812 1.813 4.562t-1.813 4.584q-1.812 1.833-4.562 1.833Z" />
                </svg>
            </form>
        </div>
    </div>

    <!--POP UPS-->

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
                 <input type="text" name="in_img" value="" id="in_img"  placeholder="Inserta URL de una imagen" autocomplete="off" class="input_form" />

                <div class="caja-padre">
                    <input type="submit" value="Agregar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarJuego">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="CancelarJuego">
                </div>

            </form>
        </div>
    </div>

    <!--Agregar Genero-->
    <div class="overlay oculto" id="overlayGenero">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/Agregar_Genero.ashx" class="form-tareas-agregar" id="form_genero">

                <label>Nombre</label>
                <div class="error_input" hidden="hidden" id="error_genero">El genero ya existe</div>
                <input type="text" name="in_genero" id="in_genero" placeholder="Nombre de la categoria" required="required" autocomplete="off" class="input_form" />


                <div class="caja-padre">
                    <input type="submit" value="Agregar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarGenero">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="CancelarGenero">
                </div>
            </form>
        </div>
    </div>

    <!--Agregar Categoria-->
    <div class="overlay oculto" id="overlayCategoria">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/Agregar_Categoria.ashx" class="form-tareas-agregar" id="form_categoria">

                <label>Nombre</label>
                <div class="error_input" hidden="hidden" id="error_categoria">La categoria ya existe</div>
                <input type="text" name="in_categoria" id="in_categoria" placeholder="Nombre de la categoria" required="required" autocomplete="off" class="input_form" />

                <label>Descripcion</label>
                <textarea name="in_descripcion_categoria" id="in_descripcion_categoria" placeholder="Descripcion de la categoria" class="input_form" required="required"></textarea>


                <div class="caja-padre">
                    <input type="submit" value="Agregar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarCategoria">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="cancelarCategoria">
                </div>
            </form>
        </div>
    </div>

    <!--Agreagar Desarrolladora-->
    <div class="overlay oculto" id="overlayDesarrolladora">
        <div class="popup-tareas-agregar">
            <form action="../Controlador/Agregar_desarrolladora.ashx" class="form-tareas-agregar" id="form_desarrolladora">


                <label>Nombre</label>
                <div class="error_input" hidden="hidden" id="error_desarrolladora">La desarrolladora ya existe</div>
                <input type="text" name="in_desarrolladora" value="" id="in_desarrolladora" placeholder="Nombre de la desarrolladora" required="required" autocomplete="off" class="input_form" />

                <label>Publisher</label>
                <input type="text" name="in_publisher" value="" id="in_publisher" placeholder="Nombre del Publisher (opcional)" autocomplete="off" class="input_form" required="required" />

                <div class="caja-padre">
                    <input type="submit" value="Agregar" class="btn_submit_popup btn-cuenta-nueva" id="AgregarDesarrolladora">
                    <input type="button" class="btn_submit_popup btn-color-rojo" value="Cancelar" id="cancelarDesarrolladora">
                </div>
            </form>
        </div>
    </div>
</body>
<script src="../JS/JQuery.js"></script>
<script src="../JS/header.js"></script>
<script src="../JS/Admin.js"></script>


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
    ArrayList lista_categoria = (ArrayList)context.Session["lista_categoria"];
    ArrayList lista_desarrolladora = (ArrayList)context.Session["lista_desarrolladora"];
    ArrayList lista_genero = (ArrayList)context.Session["lista_genero"];
    %>


    //Arrays
    var lista_juegos = [];
    var lista_categoria = [];
    var lista_desarrolladora = [];
    var lista_genero = [];

    //Inputs
    var in_game = document.getElementById('in_game');
    var in_categoria = document.getElementById('in_categoria');
    var in_desarrolladora = document.getElementById('in_desarrolladora');
    var in_genero = document.getElementById('in_genero');

    //Labels de errror
    var error_juego = document.getElementById('error_juego');
    var error_categoria = document.getElementById('error_categoria');
    var error_desarrolladora = document.getElementById('error_desarrolladora');
    var error_genero = document.getElementById('error_genero');

    

    //Botones submit
    var AgregarJuego = document.getElementById('AgregarJuego');
    var AgregarCategoria = document.getElementById('AgregarCategoria');
    var AgregarDesarrolladora = document.getElementById('AgregarDesarrolladora');
    var AgregarGenero = document.getElementById('AgregarGenero');

    /*
    //Formularios
    var form_juego = document.getElementById('form_juego');
    var form_categoria = document.getElementById('form_categoria');
    var form_desarrolladora = document.getElementById('form_desarrolladora');
    var form_genero = document.getElementById('form_genero');
    */



    //Copiar array de ASP a JS
    <%for (int i = 0; i < lista_juegos.Count; i++)
    {%>
    lista_juegos.push("<%Response.Write(lista_juegos[i]);%>");

    <%}%>

    <%for (int i = 0; i < lista_categoria.Count; i++)
    {%>
    lista_categoria.push("<%Response.Write(lista_categoria[i]);%>");

    <%}%>

     <%for (int i = 0; i < lista_desarrolladora.Count; i++)
    {%>
    lista_desarrolladora.push("<%Response.Write(lista_desarrolladora[i]);%>");

    <%}%>

    <%for (int i = 0; i < lista_genero.Count; i++)
    {%>
    lista_genero.push("<%Response.Write(lista_genero[i]);%>");

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


    //validadcion de la categoria repetida
    in_categoria.addEventListener("DOMFocusOut", function () {
        var repetido = false;
        if (in_categoria.value === "") {
            //si esta vacio remueve color
            in_categoria.classList.remove("input_valid");
            in_categoria.classList.remove("input_invalid");
        } else {


            //Busca juego repetido
            for (var i = 0; i < lista_categoria.length; i++) {
                if (in_categoria.value === lista_categoria[i]) {
                    repetido = true;
                }
            }

            //si esta repetido agrega color y msg error
            if (repetido) {
                in_categoria.classList.remove("input_valid");
                in_categoria.classList.add("input_invalid");
                AgregarCategoria.hidden = true;
                error_categoria.hidden = false;


            } else {
                in_categoria.classList.remove("input_invalid");
                in_categoria.classList.add("input_valid");
                AgregarCategoria.hidden = false;
                error_categoria.hidden = true;
            }

        }
    });





    //validadcion de la dessarrolladora repetida
    in_genero.addEventListener("DOMFocusOut", function () {
        var repetido = false;
        if (in_genero.value === "") {
            //si esta vacio remueve color
            in_genero.classList.remove("input_valid");
            in_genero.classList.remove("input_invalid");
        } else {


            //Busca juego repetido
            for (var i = 0; i < lista_genero.length; i++) {
                if (in_genero.value === lista_genero[i]) {
                    repetido = true;
                }
            }

            //si esta repetido agrega color y msg error
            if (repetido) {
                in_genero.classList.remove("input_valid");
                in_genero.classList.add("input_invalid");
                AgregarGenero.hidden = true;
                error_genero.hidden = false;


            } else {
                in_genero.classList.remove("input_invalid");
                in_genero.classList.add("input_valid");
                AgregarGenero.hidden = false;
                error_genero.hidden = true;
            }

        }
    });


    //validadcion de la dessarrolladora repetida
    in_desarrolladora.addEventListener("DOMFocusOut", function () {
        var repetido = false;
        if (in_desarrolladora.value === "") {
            //si esta vacio remueve color
            in_desarrolladora.classList.remove("input_valid");
            in_desarrolladora.classList.remove("input_invalid");
        } else {


            //Busca juego repetido
            for (var i = 0; i < lista_desarrolladora.length; i++) {
                if (in_desarrolladora.value === lista_desarrolladora[i]) {
                    repetido = true;
                }
            }

            //si esta repetido agrega color y msg error
            if (repetido) {
                in_desarrolladora.classList.remove("input_valid");
                in_desarrolladora.classList.add("input_invalid");
                AgregarDesarrolladora.hidden = true;
                error_desarrolladora.hidden = false;


            } else {
                in_desarrolladora.classList.remove("input_invalid");
                in_desarrolladora.classList.add("input_valid");
                AgregarDesarrolladora.hidden = false;
                error_desarrolladora.hidden = true;
            }

        }
    });





</script>

</html>
