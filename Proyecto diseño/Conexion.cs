using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace Pruebas
{
    public class Conexion
    {
        public SqlConnection GetConexion()
        {
            

            try
			{
                string cadena = "Data Source=HERAT__;Initial Catalog=FACTURA_BASE;Integrated Security=True";
                SqlConnection con = new SqlConnection(cadena);
                con.Open();
                return con;


            }
			catch (Exception)
			{

                return null;
			}
        }
    }
}