using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Agregar_Categoria
    /// </summary>
    public class Agregar_Categoria : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string in_categoria = context.Request["in_categoria"];
            string in_descripcion_categoria = context.Request["in_descripcion_categoria"];

            string sql = "EXECUTE agregar_categoria N'"+ in_categoria+"' , N'"+in_descripcion_categoria+"';";
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