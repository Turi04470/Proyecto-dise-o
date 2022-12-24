using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Registrar
    /// </summary>
    public class Registrar : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hola a todos");
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