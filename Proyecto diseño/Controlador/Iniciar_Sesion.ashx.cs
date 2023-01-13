using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string correo_login = context.Request["correo_login"];
            string pass_login = context.Request["pass_login"];
            int ID_USER = -1;
            Boolean _admin = false;

            string sql = "Execute iniciar_sesion N'" + correo_login + "' , N'" + pass_login + "';";

            Conexion conexion = new Conexion();
            SqlCommand cmd = new SqlCommand(sql, conexion.Open());
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();


            Boolean logueado = false;





            //si el data reader tiene informacion
            if (reader.HasRows)
            {

                while (reader.Read())
                {
                    if (correo_login.Equals(reader["correo"].ToString()) && pass_login.Equals(reader["pass"].ToString()))
                    {
                        logueado = true;
                        ID_USER = int.Parse(reader["id_user"].ToString());


                        if (Boolean.Parse(reader["_admin"].ToString()))
                        {
                            _admin = true;


                        }
                        else
                        {
                            _admin = false;

                        }

                    }

                }
            }
            else
            {

                //Codigo cuando falla el inicio

                context.Application["credenciales_incorrectos"] = 1;
                reader.Close();
                conexion.Close();
                HttpContext.Current.Response.Redirect("../Index.aspx");
            }

            if (logueado)
            {
                if (_admin)
                {
                    context.Application["_admin"] = true;

                }
                else
                {
                    context.Application["_admin"] = false;

                }

                context.Application["ID_USER"] = ID_USER;
                context.Application["login"] = true;
                reader.Close();
                conexion.Close();
                HttpContext.Current.Response.Redirect("../WEB/Inicio.aspx");

            }



          






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