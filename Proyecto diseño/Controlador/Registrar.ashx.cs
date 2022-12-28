using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Registrar
    /// </summary>
    public class Registrar : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            /*
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");
            context.Response.Write(Environment.MachineName);
            */


            string correo_login = context.Request["correo_login"];
            string pass_login = context.Request["correo_login"];


            string sql = "Execute registar_user N'Turi' , N'Turi@gmail.com' ,N'Turi', 0;";


            Conexion conexion = new Conexion();

            try
            {
                SqlCommand cmd = new SqlCommand(sql, conexion.Open());
                int n = cmd.ExecuteNonQuery();

            }
            catch (Exception)
            {
               
                throw;
            }

            conexion.Close();






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