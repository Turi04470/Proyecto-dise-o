using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de desplegar_juego
    /// </summary>
    public class desplegar_juego : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            

            int id_juego = int.Parse(context.Request["id_juego"]);

            context.Application["ID_JUEGO"]=id_juego;

            HttpContext.Current.Response.Redirect("../WEB/Juego_Detalle.aspx");


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