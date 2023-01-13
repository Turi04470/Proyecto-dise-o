using Proyecto_diseño.Clases;
using Proyecto_diseño.Objetos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Proyecto_diseño.WEB_Services
{
    /// <summary>
    /// Descripción breve de Admin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Admin : System.Web.Services.WebService
    {

        

        [WebMethod]
        public void Count_Estadisticas()
        {
            Estadisticas estadisticas = new Estadisticas();

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;

            sql = "select COUNT(id_desarrolLadora) from desarrolladora";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    estadisticas.desarrolladoras = int.Parse(reader[0].ToString());

                }
            }

            sql = "select COUNT(id_genero) from genero";

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    estadisticas.generos = int.Parse(reader[0].ToString());

                }
            }


            
            sql = "select COUNT(id_categoria) from categoria";

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    estadisticas.categorias = int.Parse(reader[0].ToString());

                }
            }



            sql = "select COUNT(id_juego) from game";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    estadisticas.juegos = int.Parse(reader[0].ToString());

                }
            }


            reader.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(estadisticas));
        }
    }
}
