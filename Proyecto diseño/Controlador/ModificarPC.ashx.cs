using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Handler3
    /// </summary>
    public class ModificarPC : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int id_userPC = int.Parse(context.Request["id_userPC"]);
            string ram = context.Request["ram"];
            string graficos = context.Request["graficos"];
            string procesador = context.Request["procesador"];
            string SO = context.Request["SO"];


            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;



            sql = "Execute eiste_pc " + id_userPC;
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();


            if (reader.HasRows)
            {
                sql = "Execute update_pc " + id_userPC + ",N'" + procesador + "', N'" + graficos + "',N'" + ram + "', N'" + SO + "'";
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();


            }
            else
            {
                sql = "Execute registar_pc " + id_userPC + ",N'" + procesador + "', N'" + graficos + "',N'" + ram + "', N'" + SO + "'";
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();


            }
            reader.Close();
            conexion.Close();
            HttpContext.Current.Response.Redirect("../WEB/Ajustes.aspx");
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