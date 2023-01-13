using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Agregar_Game
    /// </summary>
    public class Agregar_Game : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string in_game = context.Request["in_game"];
            int in_desarrolladora_juego = int.Parse(context.Request["in_desarrolladora_juego"]);
            string in_lanzamiento = context.Request["in_lanzamiento"];
            int in_categoria_juego = int.Parse(context.Request["in_categoria_juego"]);
            int in_plataforma = int.Parse(context.Request["in_plataforma"]);
            int in_idioma = int.Parse(context.Request["in_idioma"]);
            string in_img = context.Request["in_img"];


            string sql = "EXECUTE agregar_game N'" + in_game + "' , " + in_desarrolladora_juego + " , N'" + in_lanzamiento + "', " + in_categoria_juego + ", " + in_plataforma + ", " + in_idioma + ", N'" + in_img + "';";
            Conexion conexion = new Conexion();
            SqlCommand cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();

            conexion.Close();
            HttpContext.Current.Response.Redirect("../WEB/Admin.aspx");


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}