using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Agregar_desarrolladora
    /// </summary>
    public class Agregar_desarrolladora : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string in_desarrolladora = context.Request["in_desarrolladora"];
            string in_publisher = context.Request["in_publisher"];

            string sql = "EXECUTE agregar_desarrolladora N'"+in_desarrolladora+"' , N'"+in_publisher+"';";
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