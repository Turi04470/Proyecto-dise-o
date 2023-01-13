/*------------------
 ANIMACIONES DE LOS BOTENS DE LOGIN
 -------------------*/
var btn_iniciar = document.getElementById('iniciar');
var correo_login = document.getElementById('correo_login');
var pass_login = document.getElementById('pass_login');
var btn_cuenta_n = document.getElementById('btn_crear_cuenta');
var OK = document.getElementById('OK');
var overlaySesion = document.getElementById('overlaySesion');
var OK_R = document.getElementById('OK_R');
var overlayRExito = document.getElementById('overlayRExito');
/*var btn_recuperar_cuenta = document.getElementById('btn_recuperar_cuenta');*/


btn_iniciar.addEventListener("mouseover", function () {
    btn_iniciar.classList.add('animate__pulse');
});
btn_iniciar.addEventListener("mouseout", function () {
    btn_iniciar.classList.remove('animate__pulse');
});

btn_cuenta_n.addEventListener("mouseover", function () {
    btn_cuenta_n.classList.add('animate__pulse');
});
btn_cuenta_n.addEventListener("mouseout", function () {
    btn_cuenta_n.classList.remove('animate__pulse');
});
/*btn_recuperar_cuenta.addEventListener("mouseover", function () {
    btn_recuperar_cuenta.classList.add('animate__pulse');
});
btn_recuperar_cuenta.addEventListener("mouseout", function () {
    btn_recuperar_cuenta.classList.remove('animate__pulse');
});
*/
/*-------------------
 Validaciones de inputs
 --------------------*/
correo_login.addEventListener("keyup", function () {
    if (correo_login.value === "") {
        correo_login.classList.remove("input-validaciones");
    } else {
        correo_login.classList.add("input-validaciones");
    }
});

pass_login.addEventListener("keyup", function () {
    if (pass_login.value === "") {
        pass_login.classList.remove("input-validaciones");
    } else {
        pass_login.classList.add("input-validaciones");
    }
});




OK.addEventListener('click', function () {
    overlaySesion.classList.add("oculto");

});
OK_R.addEventListener('click', function () {
    overlayRExito.classList.add("oculto");

});