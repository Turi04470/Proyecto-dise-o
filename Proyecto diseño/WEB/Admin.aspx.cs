using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Proyecto_diseño.WEB
{
    public partial class Admin : System.Web.UI.Page
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
            conexion.Close();
            ArrayList lista_juegos = new ArrayList();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lista_juegos.Add(reader["titulo"].ToString());
                }
            }
            Session["lista_juegos"] = lista_juegos;



            //Para las categorias duplicadas
            sql = "select nombre from categoria";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();
            ArrayList lista_categoria = new ArrayList();

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    lista_categoria.Add(reader["nombre"].ToString());
                }
            }
            Session["lista_categoria"] = lista_categoria;
            

            //Para las desarrolladoras duplicadas
            sql = "select nombre from desarrolladora";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();
            ArrayList lista_desarrolladora = new ArrayList();

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    lista_desarrolladora.Add(reader["nombre"].ToString());
                }
            }
            Session["lista_desarrolladora"] = lista_desarrolladora;



             //Para los generos duplicadas
            sql = "select nombre from genero";
            cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            reader = cmd.ExecuteReader();
            conexion.Close();
            ArrayList lista_genero = new ArrayList();

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    lista_genero.Add(reader["nombre"].ToString());
                }
            }
            Session["lista_genero"] = lista_genero;

        }
    }
}