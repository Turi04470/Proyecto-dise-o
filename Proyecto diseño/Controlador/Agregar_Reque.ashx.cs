using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Agregar_Reque
    /// </summary>
    public class Agregar_Reque : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int id_juego = int.Parse(context.Application["ID_JUEGO"].ToString());
            string min_Procesador = context.Request["min_Procesador"];
            string min_Graficos = context.Request["min_Graficos"];
            string min_RAM = context.Request["min_RAM"];
            string min_SO = context.Request["min_SO"];
            string max_Procesador = context.Request["max_Procesador"];
            string max_Graficos = context.Request["max_Graficos"];
            string max_RAM = context.Request["max_RAM"];
            string max_SO = context.Request["max_SO"];

            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;

            sql = "select id_juego from requeriemientos where id_juego=" + id_juego;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                sql = @"EXECUTE actulizar_reque "+id_juego+",'" + min_Procesador + "','" + min_Graficos + "','" + min_RAM + "','" + min_SO + "','" + max_Procesador + "','" + max_Graficos + "','" + max_RAM + "','" + max_SO + "';";

            }
            else
            {
                sql = @"INSERT INTO requeriemientos(id_juego,min_procesador,min_graficos,min_ram,min_so,recomendado_procesador,recomendado_graficos,recomendado_ram,recomendado_so) VALUES
                         (" + id_juego + ",'" + min_Procesador + "','" + min_Graficos + "','" + min_RAM + "','" + min_SO + "','" + max_Procesador + "','" + max_Graficos + "','" + max_RAM + "','" + max_SO + "');";

            }
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();




            reader.Close();
            conexion.Close();
            HttpContext.Current.Response.Redirect("../WEB/Juego_Detalle.aspx");

            /*context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");*/
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