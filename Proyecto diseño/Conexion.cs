using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.Sql;
using System.Runtime.Remoting.Contexts;
using System.Configuration;

namespace Proyecto_diseño
{
    public class Conexion
    {

        string machine= Environment.MachineName;
        public SqlConnection Open()
        {
           // string cadena = "Data Source="+machine+";Initial Catalog=VIDEOJUEGOS;Integrated Security=True";
            string cadena = ConfigurationManager.ConnectionStrings["VIDEOJUEGOSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cadena);
            con.Open();
            return con;
        }


        public SqlConnection Close()
        {
           // string cadena = "Data Source=" + machine + ";Initial Catalog=VIDEOJUEGOS;Integrated Security=True";
            string cadena = ConfigurationManager.ConnectionStrings["VIDEOJUEGOSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cadena);
            con.Close();
            return con;
        }

    }
}