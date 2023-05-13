var logout = document.getElementById('logout');
var form_logout = document.getElementById('form_logout');
var cancelarUpdateCuenta = document.getElementById('cancelarUpdateCuenta');
var overlayEditarCuenta = document.getElementById('overlayEditarCuenta');
var bntCambiarInfoCuenta = document.getElementById('bntCambiarInfoCuenta');
var btnCambiarPC = document.getElementById('btnCambiarPC');
var overlayEditarPC = document.getElementById('overlayEditarPC');
var cancelarUpdatePC = document.getElementById('cancelarUpdatePC');



logout.addEventListener('click', function () {
    form_logout.submit();
});


bntCambiarInfoCuenta.addEventListener('click', function () {
    overlayEditarCuenta.classList.remove("oculto");

});


cancelarUpdateCuenta.addEventListener('click', function () {
    overlayEditarCuenta.classList.add("oculto");

});


btnCambiarPC.addEventListener('click', function () {
    overlayEditarPC.classList.remove("oculto");


});

cancelarUpdatePC.addEventListener('click', function () {
    overlayEditarPC.classList.add("oculto");

});


//Ajax para mostrar datos
$(document).ready(function () {

    $.ajax({
        //llamar a un web service
        url: '../WEB Services/Ajustes.asmx/DatosUsuario',
        //le pasas los parametros
        //data: { id_user: 1 },
        dataType: "json",
        method: 'post',
        //les la data
        success: function (data) {
            $('#user_nombre').html(data.nombre);
            $('#user_correo').html(data.correo);
            if (parseInt(data.edad) == 0) {
                $('#user_edad').html("sin definir");
            } else {

                $('#user_edad').html(data.edad);
            }

        },
        error: function (err) {
            console.log(err);
        }
    });


    $.ajax({
        url: '../WEB Services/Ajustes.asmx/Pc_info',
        dataType: "json",
        method: 'post',
        success: function (data) {
            $('#pc_procesador').html(data.procesador);
            $('#pc_graficos').html(data.graficos);
            $('#pc_ram').html(data.ram);
            $('#pc_so').html(data.so);
        },
        error: function (err) {
            console.log(err);
        }
    });

});

