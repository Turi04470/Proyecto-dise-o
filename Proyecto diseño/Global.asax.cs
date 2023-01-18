using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Proyecto_diseño
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Conexion conexion = new Conexion();
            conexion.Close();
            //Variables para login
            Application["_admin"] = false;
            Application["ID_USER"] = 0;
            Application["login"] = false;


            //Variables para el registro
            Application["registro_exito"] = 2;
            Application["registro_admin"] = false;
            Application["credenciales_incorrectos"] = 2;
            Application["Existe_usuario"] = 2;
            Application["fallo_desconocido"] = 2;

            //Variable para Inicio
            Application["ID_JUEGO"] = 0;
            Application["sql_filtro"] = @"SELECT 
                    game.id_juego,
                    game.titulo,
                    categoria.nombre as categoria,
                    game.img as urlIMG
                FROM game
                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria";

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
            

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application["SesionesUsuario"] = (int)Application["SesionesUsuario"] - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        
    }
}