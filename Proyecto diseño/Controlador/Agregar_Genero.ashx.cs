using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Agregar_Genero
    /// </summary>
    public class Agregar_Genero : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string in_genero = context.Request["in_genero"];

            string sql = "EXECUTE agregar_genero N'"+in_genero+"';";
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