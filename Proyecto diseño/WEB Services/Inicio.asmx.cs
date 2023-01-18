using Proyecto_diseño.Clases;
using Proyecto_diseño.Objetos;
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
    /// Descripción breve de Inicio
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Inicio : System.Web.Services.WebService
    {

        [WebMethod]
        public void consultarVideojuegos()
        {
            HttpContext context = HttpContext.Current;

            
            List<Juego> juegos = new List<Juego>();

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;



            sql = context.Application["sql_filtro"].ToString();

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Juego juego = new Juego();
                    juego.id_juego = int.Parse(reader[0].ToString());
                    juego.titulo = reader[1].ToString();
                    juego.categoria = reader[2].ToString();
                    juego.img = reader[3].ToString();
                    juegos.Add(juego);
                    
                    

                }
            }


            reader.Close();
            conexion.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(juegos));
        }


        
    }
}
