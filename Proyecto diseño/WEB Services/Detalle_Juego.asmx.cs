using Proyecto_diseño.Objetos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Proyecto_diseño.WEB_Services
{
    /// <summary>
    /// Descripción breve de Detalle_Juego
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Detalle_Juego : System.Web.Services.WebService
    {

        [WebMethod]
        public void ObtenerJuego()
        {


            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;

            Juego_detalle juego = new Juego_detalle();

            sql = "SELECT \r\n\tgame.id_juego,\r\n\tgame.titulo,\r\n\tdesarrolladora.nombre as desarrolladora,\r\n\tgame.lanzamiento, \r\n\tcategoria.nombre as categoria,\r\n\tplataforma.nombre as plataforma,\r\n\tidioma.nombre as idioma,\r\n\tgame.img as urlIMG\r\n\t\r\nFROM game\t\r\n\tINNER JOIN desarrolladora ON desarrolladora.id_desarrolladora=game.id_desarrolladora\r\n\tINNER JOIN categoria ON categoria.id_categoria=game.id_categoria\r\n\tINNER JOIN plataforma ON plataforma.id_plataforma=GAME.id_plataforma\r\n\tINNER JOIN idioma ON idioma.id_idioma=game.id_idioma\r\nWHERE game.id_juego=" + id_juego;

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    juego.id_juego = int.Parse(reader[0].ToString());
                    juego.titulo = reader["titulo"].ToString();
                    juego.desarrolladora = reader["desarrolladora"].ToString();
                    juego.lanzamiento = reader["lanzamiento"].ToString();
                    juego.categoria = reader["categoria"].ToString();
                    juego.plataforma = reader["plataforma"].ToString();
                    juego.idioma = reader["idioma"].ToString();
                    juego.img = reader["urlIMG"].ToString();



                }
            }


            reader.Close();
            conexion.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(juego));
        }


        [WebMethod]
        public void Consultar_Reque()
        {
            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;

            Reque reque = new Reque();

            sql = "SELECT * FROM requeriemientos WHERE id_juego=" + id_juego;

            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
           

            if (reader.HasRows)
            {
                while (reader.Read())
                {


                    reque.min_procesador = reader["min_procesador"].ToString();
                    reque.min_graficos = reader["min_graficos"].ToString();
                    reque.min_ram = reader["min_ram"].ToString();
                    reque.min_so = reader["min_so"].ToString();
                    reque.recomendado_procesador = reader["recomendado_procesador"].ToString();
                    reque.recomendado_graficos = reader["recomendado_graficos"].ToString();
                    reque.recomendado_ram = reader["recomendado_ram"].ToString();
                    reque.recomendado_so = reader["recomendado_so"].ToString();




                }
            }


            reader.Close();
            conexion.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(reque));
        }

        [WebMethod]
        public void Borrar_juego()
        {
            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;

            sql = "delete from requeriemientos where id_juego=" + id_juego;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            conexion.Close();

            


            sql = "delete from favoritos where id_juego=" + id_juego;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            conexion.Close();


            sql = "delete from no_favoritos where id_juego=" + id_juego;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            conexion.Close();
            //borado juego al final
            sql = "delete from game where id_juego=" + id_juego;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            conexion.Close();


        }


        [WebMethod]
        public void Consultar_fav()
        {
            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());
            int ID_USER = int.Parse(context.Application["ID_USER"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            Favorito favorito = new Favorito();
            SqlCommand cmd;
            SqlDataReader reader;


            sql = "select * from favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                favorito.fav = true;
            }

            sql = "select * from no_favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                favorito.nofav = true;
            }

            reader.Close();
            conexion.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(favorito));

        }

        [WebMethod]
        public void Agregar_fav()
        {
            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());
            int ID_USER = int.Parse(context.Application["ID_USER"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            Favorito favorito = new Favorito();
            SqlCommand cmd;
            SqlDataReader reader;


            sql = "select * from favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                sql = "delete from favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();
            }
            else
            {
                sql = @"INSERT INTO favoritos(id_user,id_juego) VALUES
                    (" + ID_USER + "," + id_juego + ");";
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();

            }

            sql = @"select * from no_favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                sql = "delete from no_favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();
            }


            reader.Close();
            conexion.Close();
        }
        [WebMethod]
        public void Agregar_nofav()
        {
            HttpContext context = HttpContext.Current;

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());
            int ID_USER = int.Parse(context.Application["ID_USER"].ToString());

            string sql;
            Conexion conexion = new Conexion();
            Favorito favorito = new Favorito();
            SqlCommand cmd;
            SqlDataReader reader;


            sql = "select * from no_favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                sql = "delete from no_favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();
            }
            else
            {
                sql = @"INSERT INTO no_favoritos(id_user,id_juego) VALUES
                    (" + ID_USER + "," + id_juego + ");";
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();

            }

            sql = @"select * from favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();

            if (reader.HasRows)
            {
                sql = "delete from favoritos where id_juego=" + id_juego + " and id_user=" + ID_USER;
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                conexion.Close();
            }


            reader.Close();
            conexion.Close();
        }






    }
}
