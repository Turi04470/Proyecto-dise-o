var btn_filtros = document.getElementById('btn_filtros');
var cancelar_filtro = document.getElementById('cancelar_filtro');
var overlay_filtro = document.getElementById('overlay_filtro');


btn_filtros.addEventListener('click', function () {
    overlay_filtro.classList.remove('oculto');
});

cancelar_filtro.addEventListener('click', function () {
    overlay_filtro.classList.add(('oculto'));
});


//Para los filtros mostrar y ocultar selects
//Selects generados por servidor
var year = document.getElementById('year');
var categoria = document.getElementById('categoria');
var plataforma = document.getElementById('plataforma');

//Escritos manuelamente
var tipo_vista = document.getElementById('tipo_vista');

tipo_vista.addEventListener('change', function () {
    switch (parseInt(tipo_vista.value)) {


        case 3: //Caso de que se selecione año
            //Mover a defult demas selet y ocultar
            year.selectedIndex = 0
            categoria.selectedIndex = 0
            plataforma.selectedIndex = 0



            year.classList.remove('hidden');
            categoria.classList.add('hidden');
            plataforma.classList.add('hidden');

            break;

        case 4: //Caso ´plataforma
            //Mover a defult demas selet y ocultar
            year.selectedIndex = 0
            categoria.selectedIndex = 0
            plataforma.selectedIndex = 0;

            year.classList.add('hidden');
            categoria.classList.add('hidden');
            plataforma.classList.remove('hidden');
            break;

        case 5: //Caso categoria
            //Mover a defult demas selet y ocultar
            year.selectedIndex = 0
            categoria.selectedIndex = 0
            plataforma.selectedIndex = 0

            year.classList.add('hidden');
            categoria.classList.remove('hidden');
            plataforma.classList.add('hidden');
            break;


        default:
            year.classList.add('hidden');
            categoria.classList.add('hidden');
            plataforma.classList.add('hidden');

            year.selectedIndex = 0
            categoria.selectedIndex = 0
            plataforma.selectedIndex = 0
            break;
    }
});







//Ajax para mostrar datos
$(document).ready(function () {

    $.ajax({
        url: '../WEB Services/Inicio.asmx/consultarVideojuegos',
        dataType: "json",
        method: 'post',
        success: function (data) {
            // $('#pc_procesador').html(data.procesador);
            window.console.log(data);
            var obj = data;
            var x;
            for (x of obj) {

                //aqui agregaremos los juegos


                if (x.img == '') {
                    x.img = '../Media/IMG/default_game.jpg';
                }

                $('#contenedor_juegos').append(`
                    <!--Inicia Juego-->
                    <div class="juego" id="contenedor_game">
                        <form action="../Controlador/desplegar_juego.ashx" class="" id="form_juego">
                            <div class="imagen_juego" id="img_juego">
                                <img src="${x.img}" class="img_juego" onClick="submit();"/>
                            </div>
                            <input name="id_juego" id="id_juego" type="text" value="${x.id_juego}" class="id_input hidden" />
                            <div class="caja-padre ">
                                <input type="submit" class="titulo_juego" value="${x.titulo}" />
                            </div>
                        </form>

                        <div class="caja-padre ">
                            <div class="categoria_juego">${x.categoria}</div>
                        </div>


                    </div>
                    <!--Fin Juego-->
                `);


            }

        },
        error: function (err) {
            window.console.log(err);
        }
    });




    //Agregar campos los select
    $("#year").prepend('<option selected="selected" hidden="hidden" value="0">Selecione a\361o</option>');
    $("#categoria").prepend('<option selected="selected" hidden="hidden" value="0">Selecione categoria</option>');
    $("#plataforma").prepend('<option selected="selected" hidden="hidden" value="0">Selecione plataforma</option>');

});
