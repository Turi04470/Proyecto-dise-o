using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_diseño.Controlador
{
    public partial class Juego_Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql;
            Conexion conexion = new Conexion();
            SqlCommand cmd;
            SqlDataReader reader;

            sql = "select titulo from game";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();

            ArrayList lista_juegos = new ArrayList();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lista_juegos.Add(reader["titulo"].ToString());
                }
            }
            Session["lista_juegos"] = lista_juegos;
            conexion.Close();
            reader.Close();
        }
    }
}