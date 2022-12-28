using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.Sql;

namespace Proyecto_diseño
{
    public class Conexion
    {
        public SqlConnection Open()
        {
            string cadena = "Data Source=HERAT__;Initial Catalog=VIDEOJUEGOS;Integrated Security=True";
            SqlConnection con = new SqlConnection(cadena);
            con.Open();
            return con;
        }


        public SqlConnection Close()
        {
            string cadena = "Data Source=HERAT__;Initial Catalog=VIDEOJUEGOS;Integrated Security=True";
            SqlConnection con = new SqlConnection(cadena);
            con.Close();
            return con;
        }

    }
}