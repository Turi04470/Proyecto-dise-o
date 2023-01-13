using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Registrar
    /// </summary>
    public class Registrar : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            /*
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");
            context.Response.Write(Environment.MachineName);
            */


            string correo_registro = context.Request["correo_registro"];
            string pass_registro = context.Request["pass_registro"];
            string usuario_registro = context.Request["usuario_registro"];

            Boolean registro_admin = (Boolean)(context.Application["registro_admin"]);
            context.Application["Existe_usuario"] = 2;



            string sql = "Execute existe_correo N'" + correo_registro + "';";
            Conexion conexion = new Conexion();
            SqlCommand cmd = new SqlCommand(sql, conexion.Open());




            try
            {
                cmd.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception)
            {

                context.Application["fallo_desconocido"] = true;

                conexion.Close();
                HttpContext.Current.Response.Redirect("../WEB/Registro.aspx");
                throw;
            }
            SqlDataReader reader = cmd.ExecuteReader();



            //si el data reader tiene informacion
            if (reader.HasRows)
            {
                //Ya existe el usuario
                context.Application["Existe_usuario"] = 1;
                context.Application["registro_exito"] = 0;
                HttpContext.Current.Response.Redirect("../WEB/Registro.aspx");
            }
            else
            {

                if (registro_admin)
                {
                    sql = "Execute registar_user_admin N'" + usuario_registro + "' , N'" + correo_registro + "' ,N'" + pass_registro + "',1;";
                }
                else
                {
                    sql = "Execute registar_user N'" + usuario_registro + "' , N'" + correo_registro + "' ,N'" + pass_registro + "';";
                }
                context.Application["registro_admin"] = false;

                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();




                //Cmprobar que te registraste

                sql = "Execute existe_correo N'" + correo_registro + "'";
                cmd = new SqlCommand(sql, conexion.Open());
                cmd.ExecuteNonQuery();
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    context.Application["registro_exito"] = 1;
                    reader.Close();
                    conexion.Close();
                    HttpContext.Current.Response.Redirect("../Index.aspx");
                }













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