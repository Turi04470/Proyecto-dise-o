using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Permitir_registro_admin
    /// </summary>
    public class Permitir_registro_admin : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Application["_admin"] = false;
            context.Application["ID_USER"] = 0;
            context.Application["login"] = false;
            context.Application["registro_admin"] = true;
            HttpContext.Current.Response.Redirect("../WEB/Registro.aspx");
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