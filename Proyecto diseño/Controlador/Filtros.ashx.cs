using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Controlador
{
    /// <summary>
    /// Descripción breve de Handler2
    /// </summary>
    public class Handler2 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int orden = int.Parse(context.Request["orden"]);
            int tipo_vista = int.Parse(context.Request["tipo_vista"]);
            string categoria = context.Request["categoria"];
            int year = int.Parse(context.Request["year"]);
            string plataforma = context.Request["plataforma"];

            int id_user = (int)context.Application["ID_USER"];

            Boolean orden_B = false;
            Boolean tipo_vista_B = false;
           


            //comprobar si no esta en blanco
            if (orden != 0)
            {
                orden_B = true;
            }

            if (tipo_vista != 0)
            {
                tipo_vista_B = true;
            }


            context.Response.ContentType = "text/plain";

            //si se cumplen ambos tipos de filtros
            if (orden_B && tipo_vista_B)
            {
                context.Response.Write("here ambas");
                
                //Evaluar tipo de vista
                switch (tipo_vista)
                {
                    case 1: //Favoritos
                        //Evaluar tipo 
                        switch (orden)
                        {
                            case 1: //nombre
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN favoritos ON favoritos.id_juego=game.id_juego
                                WHERE favoritos.id_user="+id_user+
                                "ORDER BY game.titulo";
                                break; //fecha
                            case 2:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN favoritos ON favoritos.id_juego=game.id_juego
                                WHERE favoritos.id_user=" + id_user +
                                "ORDER BY game.lanzamiento";

                                break; //categoria
                            case 3:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN favoritos ON favoritos.id_juego=game.id_juego
                                WHERE favoritos.id_user=" + id_user +
                                "ORDER BY categoria.nombre";
                                break;
                        }
                        break;
                    case 2: //No favoritos
                        switch (orden)
                        {
                            case 1: //nombre
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN no_favoritos ON no_favoritos.id_juego=game.id_juego
                                WHERE no_favoritos.id_user=" + id_user +
                                "ORDER BY game.titulo";
                                break; //fecha
                            case 2:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN no_favoritos ON no_favoritos.id_juego=game.id_juego
                                WHERE no_favoritos.id_user=" + id_user +
                                "ORDER BY game.lanzamiento";

                                break; //categoria
                            case 3:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN no_favoritos ON no_favoritos.id_juego=game.id_juego
                                WHERE no_favoritos.id_user=" + id_user +
                                "ORDER BY categoria.nombre";
                                break;
                        }
                        break;
                    case 3://Year
                           //Evaluar tipo 
                        switch (orden)
                        {
                            case 1: //nombre
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE game.lanzamiento BETWEEN DATEFROMPARTS("+year+ @",1,1) and DATEFROMPARTS("+year+@",12,31)
                                ORDER BY game.titulo";
                                break; //fecha
                            case 2:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE game.lanzamiento BETWEEN DATEFROMPARTS(" + year + @",1,1) and DATEFROMPARTS(" + year + @",12,31)
                                ORDER BY game.lanzamiento";

                                break; //categoria
                            case 3:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE game.lanzamiento BETWEEN DATEFROMPARTS(" + year + @",1,1) and DATEFROMPARTS(" + year + @",12,31)
                                ORDER BY categoria.nombre";
                                break;
                        }
                        break;
                    case 4://Plataforma

                        //Evaluar tipo 
                        switch (orden)
                        {
                            case 1: //nombre
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN plataforma on plataforma.id_plataforma=game.id_plataforma
                                WHERE plataforma.nombre='"+plataforma+@"'
                                ORDER BY game.titulo";
                                break; //fecha
                            case 2:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN plataforma on plataforma.id_plataforma=game.id_plataforma
                                WHERE plataforma.nombre='" + plataforma + @"'
                                ORDER BY game.lanzamiento";

                                break; //categoria
                            case 3:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                INNER JOIN plataforma on plataforma.id_plataforma=game.id_plataforma
                                WHERE plataforma.nombre='" + plataforma + @"'
                                ORDER BY categoria.nombre";
                                break;                           
                        }
                        break;
                    case 5://Categoria

                        //Evaluar tipo 
                        switch (orden)
                        {
                            case 1: //nombre
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE categoria.nombre='"+categoria+@"'
                                ORDER BY game.titulo";
                                break; //fecha
                            case 2:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE categoria.nombre='" + categoria + @"'
                                ORDER BY game.lanzamiento";

                                break; //categoria
                            case 3:
                                context.Application["sql_filtro"] =
                                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                                WHERE categoria.nombre='" + categoria + @"'
                                ORDER BY categoria.nombre";
                                break;
                        }
                        break;

                }
            }
            else if (orden_B)
            {
                context.Response.Write("here orden");

                //Evaluar tipo 
                switch (orden)
                {
                    case 1: //nombre
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        ORDER BY game.titulo";
                        break; //fecha
                    case 2:
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        ORDER BY game.lanzamiento";
                        break; //categoria
                    case 3:
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        ORDER BY categoria.nombre";
                        break;

                }
            }
            else if (tipo_vista_B)
            {
                context.Response.Write("here vista");

                switch (tipo_vista)
                {
                    case 1: //Favoritos
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        INNER JOIN favoritos ON favoritos.id_juego=game.id_juego
                        WHERE favoritos.id_user=" + id_user;
                        break;
                    case 2: //No favoritos
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        INNER JOIN no_favoritos ON no_favoritos.id_juego=game.id_juego
                        WHERE no_favoritos.id_user=" + id_user;
                        break;
                    case 3://Year
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        WHERE game.lanzamiento BETWEEN DATEFROMPARTS(" + year + @",1,1) and DATEFROMPARTS(" + year + @",12,31)";
                        break;
                    case 4://Plataforma
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        INNER JOIN plataforma on plataforma.id_plataforma=game.id_plataforma
                        WHERE plataforma.nombre='" + plataforma + "'";
                        break;
                    case 5://Categoria
                        context.Application["sql_filtro"] =
                        @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                        INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
                        WHERE categoria.nombre='" + categoria+"'";
                        break;
                }

            }
            else
            {
                context.Response.Write("no filtros");
                context.Application["sql_filtro"] =
                @"SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
                INNER JOIN categoria ON categoria.id_categoria=game.id_categoria";
            }

            context.Response.Write("\nConsulta\n"+context.Application["sql_filtro"]);
            HttpContext.Current.Response.Redirect("../WEB/Inicio.aspx");
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