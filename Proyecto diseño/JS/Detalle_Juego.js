var overlay_opciones = document.getElementById('overlay_opciones');
var Cancelar_popup = document.getElementById('Cancelar_popup');
var editar = document.getElementById('editar');
var game = document.getElementById('game');
var Requeriemientos = document.getElementById('Requeriemientos');
var borrar = document.getElementById('borrar');
var overlay_reque = document.getElementById('overlay_reque');
var overlayJuego = document.getElementById('overlayJuego');
var CancelarJuego = document.getElementById('CancelarJuego');
var CancelarReque = document.getElementById('CancelarReque');
var fav = document.getElementById('fav');
var nofav = document.getElementById('nofav');


var fav_ = false;
var nofav_ = false;

Cancelar_popup.addEventListener('click', function () {
    overlay_opciones.classList.add('oculto');
});

editar.addEventListener('click', function () {
    overlay_opciones.classList.remove('oculto');
});

game.addEventListener('click', function () {
    overlay_opciones.classList.add('oculto');
    overlayJuego.classList.remove('oculto');
});

Requeriemientos.addEventListener('click', function () {
    overlay_opciones.classList.add('oculto');
    overlay_reque.classList.remove('oculto');
});
borrar.addEventListener('click', function () {
    //Borrar Juego
    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/Borrar_juego',
        dataType: "json",
        method: 'post',
        success: function () {



        },
        error: function (err) {
            console.log(err);
        }
    });

    alert("Se Borro el juego");
    window.location.href = "Inicio.aspx";
});
CancelarJuego.addEventListener('click', function () {

    overlayJuego.classList.add("oculto");
});

CancelarReque.addEventListener('click', function () {

    overlay_reque.classList.add("oculto");
});

fav.addEventListener('click', function () {
    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/Agregar_fav',
        
        method: 'post',
        
        error: function (err) {
            console.log(err);
        }
    });
    
    window.location.reload();

});

nofav.addEventListener('click', function () {
    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/Agregar_nofav',

        method: 'post',

        error: function (err) {
            console.log(err);
        }
    });

    window.location.reload();
    
});





//Consultas con AJAX


var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];
var fecha = new Date();
$(document).ready(function () {

    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/ObtenerJuego',
        dataType: "json",
        method: 'post',
        success: function (data) {
            var fecha = new Date(Date.parse(data.lanzamiento));



            $('#Desarrolladora').html(data.desarrolladora);
            $('#Titulo').html(data.titulo);
            $('#Lanzamiento').html(`${fecha.getDate()} de ${meses[fecha.getMonth()]} de ${fecha.getFullYear()}`);
            $('#Categoria').html(data.categoria);
            $('#Plataforma').html(data.plataforma);
            $('#Idioma').html(data.idioma);

            if (data.img != '') {
                $('#img_').html(`<img src="${data.img}" id="img_"/>`);
            } else {
                $('#img_').html(`<img src="../Media/IMG/default_game.jpg" class="img_juego" />`);
            }

        },
        error: function (err) {
            console.log(err);
        }
    });


    //Requereimientos
    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/Consultar_Reque',
        dataType: "json",
        method: 'post',
        success: function (data) {

            if (data.min_procesador != null) {
                $('#min_procesador').html(data.min_procesador);
                $('#min_graficos').html(data.min_graficos);
                $('#min_ram').html(data.min_ram);
                $('#min_so').html(data.min_so);
                $('#recomendado_procesador').html(data.recomendado_procesador);
                $('#recomendado_graficos').html(data.recomendado_graficos);
                $('#recomendado_ram').html(data.recomendado_ram);
                $('#recomendado_so').html(data.recomendado_so);
            } else {
                $(".labels").remove();
                $("#min").remove();
                $("#max").remove();
                $(".Requerimientos").text("Sin Requerimientos");

            }




        },
        error: function (err) {
            console.log(err);
        }
    });

    
    favoritos();



});


function favoritos() {
    //Fav
    $.ajax({
        url: '../WEB Services/Detalle_Juego.asmx/Consultar_fav',
        dataType: "json",
        method: 'post',
        success: function (data) {
            
            if (data.fav) {
                $("#fav").addClass("color-red");
            } 
            if (data.nofav) {
                $("#nofav").addClass("color-morado");
            } 
        },
        error: function (err) {
            console.log(err);
        }
    });
}




