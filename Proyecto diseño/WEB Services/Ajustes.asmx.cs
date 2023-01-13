using Proyecto_diseño.Clases;
using Proyecto_diseño.Controlador;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Proyecto_diseño.WEB_Services
{
    /// <summary>
    /// Descripción breve de Datos_Usuario
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
    // [System.Web.Script.Services.ScriptService]
    public class Datos_Usuario : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public void DatosUsuario()
        {

            HttpContext context = HttpContext.Current;
            int id_user = (int)context.Application["ID_USER"];
            Usuario usuario = new Usuario();


            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;



            sql = "Execute consultar_usuario " + id_user;
            
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    usuario.id_user = int.Parse(reader["id_user"].ToString());
                    usuario.nombre = reader["nombre"].ToString();
                    usuario.pass = reader["pass"].ToString();
                    usuario.correo = reader["correo"].ToString();
                    usuario.edad = int.Parse(reader["edad"].ToString());
                    usuario._admin = Boolean.Parse(reader["_admin"].ToString());
                    
                    
                }
            }

            conexion.Close();
            reader.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(usuario));
            
            
        }
        [WebMethod]
        public void Pc_info()
        {
            HttpContext context = HttpContext.Current;
            int id_user = (int)context.Application["ID_USER"];
            Computadora computadora = new Computadora();


            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;



            sql = "Execute consultar_pc " + id_user;

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    computadora.id_user = int.Parse(reader["id_user"].ToString());
                    computadora.procesador = reader["procesador"].ToString();
                    computadora.graficos = reader["graficos"].ToString();
                    computadora.ram = reader["ram"].ToString();
                    computadora.so = reader["so"].ToString();


                }
            }
            conexion.Close();
            reader.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(computadora));

        }
    }
}
