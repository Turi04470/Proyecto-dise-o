using Pruebas;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

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
            string pass_login = context.Request["correo_login"];

            context.Response.ContentType = "text/plain";
            context.Response.Write(Environment.MachineName);
            
            /*
            string sql = "insert into cat_clie (id_clie , nom_clie , tel_clie , dir_clie ) values (4,'Michael Bentley','55811100377','511 Terrill Centers Suite 973 - Texarkana,NM / 20520')";
            Conexion cn = new Conexion();
            try
            {

                SqlCommand cmd = new SqlCommand(sql, cn.GetConexion());
                int n = cmd.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }

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