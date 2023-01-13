
var link_inicio = document.getElementById('link_inicio');
var link_ajustes = document.getElementById('link_ajustes');
var link_admin = document.getElementById('link_admin');
var titulo_pagina = document.getElementById('titulo_pagina');



window.addEventListener('load', function () {
	if (link_inicio.innerHTML === titulo_pagina.innerHTML) {
		link_inicio.classList.add("here");
        
	}

	if (link_ajustes.innerHTML === titulo_pagina.innerHTML) {
        link_ajustes.classList.add("here");
     
	}
	if (link_admin.innerHTML === titulo_pagina.innerHTML) {
        link_admin.classList.add("here");
     
	}

	



});






$(document).ready(function (){

    $(window).scroll(function () {
        if ($(this).scrollTop() > 0) {
			//$('header').addClass('header2');
            $('#header').addClass('header-fixed');
            $('.div-cuerpo-tareas-tutorias').addClass('margen');
        } else {
            $('#header').removeClass('header-fixed');
			//$('header').removeClass('header2');
            $('.div-cuerpo-tareas-tutorias').removeClass('margen');
        }
    });

});




