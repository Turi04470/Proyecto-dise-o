using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_diseño.Objetos
{
    public class Juego_detalle
    {
        public int id_juego { get; set; }
        public string titulo { get; set; }
        public string desarrolladora { get; set; }
        public string lanzamiento { get; set; }
        public string categoria { get; set; }
        public string plataforma { get; set; }
        public string idioma { get; set; }
        public string img { get; set; }
    }
}