// JavaScript Document
var game_icon = document.getElementById('game_icon');
var CancelarJuego = document.getElementById('CancelarJuego');
var overlayJuego = document.getElementById('overlayJuego');
var administrador_icon = document.getElementById('administrador_icon');
var newAdmin = document.getElementById('newAdmin');
var genero_icon = document.getElementById('genero_icon');
var CancelarGenero = document.getElementById('CancelarGenero');
var overlayGenero = document.getElementById('overlayGenero');
var overlayCategoria = document.getElementById('overlayCategoria');
var cancelarCategoria = document.getElementById('cancelarCategoria');
var categoria_icon = document.getElementById('categoria_icon');
var desarrolladora_icon = document.getElementById('desarrolladora_icon');
var overlayDesarrolladora = document.getElementById('overlayDesarrolladora');
var cancelarDesarrolladora = document.getElementById('cancelarDesarrolladora');


game_icon.addEventListener('click', function () {
	overlayJuego.classList.remove("oculto");
});
CancelarJuego.addEventListener('click', function () {

	overlayJuego.classList.add("oculto");
});

administrador_icon.addEventListener('click', function () {
	newAdmin.submit();
});


genero_icon.addEventListener('click', function () {
	overlayGenero.classList.remove("oculto");
});
CancelarGenero.addEventListener('click', function () {

	overlayGenero.classList.add("oculto");
});


categoria_icon.addEventListener('click', function () {
	overlayCategoria.classList.remove("oculto");
});


cancelarCategoria.addEventListener('click', function () {

	overlayCategoria.classList.add("oculto");
});
desarrolladora_icon.addEventListener('click', function () {
	overlayDesarrolladora.classList.remove("oculto");
});


cancelarDesarrolladora.addEventListener('click', function () {

	overlayDesarrolladora.classList.add("oculto");
});




//Ajax

$(document).ready(function () {

     $.ajax({
         url: '../WEB Services/Admin.asmx/Count_Estadisticas',
        dataType: "json",
        method: 'post',
        success: function (data) {
            $('#desarrolladoras').html(data.desarrolladoras );
            $('#juegos').html(data.juegos);
            $('#generos').html(data.generos);
            $('#categorias').html(data.categorias);
        },
        error: function (err) {
            console.log(err);
        }
    });

});



