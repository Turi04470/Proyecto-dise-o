using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string correo_login = context.Request["correo_login"];
            string pass_login = context.Request["pass_login"];


            string sql = "Execute iniciar_sesion N'" + correo_login + "' , N'" + pass_login + "';";

            Conexion conexion = new Conexion();

            SqlCommand cmd = new SqlCommand(sql, conexion.Open());
            int n = cmd.ExecuteNonQuery();

            SqlDataReader reader = cmd.ExecuteReader();


            //si el data reader tiene informacion
            if (reader.HasRows)
            {

                while (reader.Read())
                {
                    if (correo_login.Equals(reader["correo"].ToString()) && pass_login.Equals(reader["pass"].ToString()))
                    {
                        HttpContext.Current.Response.Redirect("https://www.kyocode.com");
                        
                    }
                    
                }
            }
            else
            {
                HttpContext.Current.Response.Redirect("../WEB/404.html");
            }



            reader.Close();





            //Cerrar conexion
            conexion.Close();

            /*
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");
            context.Response.Write(Environment.MachineName);

            */




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