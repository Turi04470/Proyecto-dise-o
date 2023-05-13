/*----------------
 ANIMACIONES DE GENESIS
 -----------------*/
var anima_G = document.getElementById("g");
var anima_E = document.getElementById("e");
var anima_N = document.getElementById("n");
var anima_EE = document.getElementById("ee");
var anima_S = document.getElementById("s");
var anima_I = document.getElementById("i");
var anima_SS = document.getElementById("ss");

anima_G.addEventListener("animationend", g_end, false);
anima_E.addEventListener("animationend", e_end, false);
anima_N.addEventListener("animationend", n_end, false);
anima_EE.addEventListener("animationend", ee_end, false);
anima_S.addEventListener("animationend", s_end, false);
anima_I.addEventListener("animationend", i_end, false);
anima_SS.addEventListener("animationend", ss_end, false);

function g_end() {
    anima_G.classList.remove('opacity');
}
function e_end() {
    anima_E.classList.remove('opacity');
}
function n_end() {
    anima_N.classList.remove('opacity');
}
function ee_end() {
    anima_EE.classList.remove('opacity');
}
function s_end() {
    anima_S.classList.remove('opacity');
}
function i_end() {
    anima_I.classList.remove('opacity');
}
function ss_end() {
    anima_SS.classList.remove('opacity');
}// JavaScript Document