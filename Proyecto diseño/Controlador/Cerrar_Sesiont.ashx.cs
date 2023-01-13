using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Cerrar_Sesiont
    /// </summary>
    public class Cerrar_Sesiont : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Application["login"] = false;
            context.Application["fallo_desconocido"] = 2;
            context.Application["Existe_usuario"] = 2;
            context.Application["credenciales_incorrectos"] = 2;
            context.Application["registro_exito"] = 2;
            context.Application["_admin"] = false;
            HttpContext.Current.Response.Redirect("../Index.aspx");
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