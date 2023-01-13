var btn_filtros = document.getElementById('btn_filtros');
var cancelar_filtro = document.getElementById('cancelar_filtro');
var overlay_filtro = document.getElementById('overlay_filtro');


btn_filtros.addEventListener('click', function () {
	overlay_filtro.classList.remove('oculto');
});

cancelar_filtro.addEventListener('click', function () {
	overlay_filtro.classList.add(('oculto'));
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

});
