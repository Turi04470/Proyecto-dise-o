using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de ModificarCuenta
    /// </summary>
    public class ModificarCuenta : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int id_userCuenta = int.Parse(context.Request["id_userCuenta"]);
            string nombre = context.Request["nombre"];
            string correo = context.Request["correo"];
            string edad = context.Request["edad"];



            context.Response.ContentType = "text/plain";

            context.Response.Write(id_userCuenta + "\n");
            context.Response.Write(nombre + "\n");
            context.Response.Write(correo + "\n");
            context.Response.Write(edad + "\n");
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