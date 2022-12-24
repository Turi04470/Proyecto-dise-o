/*variables*/
var usuario_registro = document.getElementById("usuario_registro");
var correo_registro = document.getElementById("correo_registro");
var pass_registro = document.getElementById("pass_registro");
var btn_registrarse = document.getElementById("registrarse");
/*----------------
 Animcaiones
 -----------------*/
btn_registrarse.addEventListener("mouseover", function () {
    btn_registrarse.classList.add('animate__pulse');
});
btn_registrarse.addEventListener("mouseout", function () {
    btn_registrarse.classList.remove('animate__pulse');
});

/*-----------------
 validaciones de inputs
 -----------------*/
usuario_registro.addEventListener("keyup", function () {
    if (usuario_registro.value === "") {
        usuario_registro.classList.remove("input-validaciones");
    } else {
        usuario_registro.classList.add("input-validaciones");
    }
});

correo_registro.addEventListener("keyup", function () {
    if (correo_registro.value === "") {
        correo_registro.classList.remove("input-validaciones");
    } else {
        correo_registro.classList.add("input-validaciones");
    }
});

pass_registro.addEventListener("keyup", function () {
    if (pass_registro.value === "") {
        pass_registro.classList.remove("input-validaciones");
    } else {
        pass_registro.classList.add("input-validaciones");
    }
});// JavaScript Document