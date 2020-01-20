using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace Modal
{
    public class TablaPrueba
    {
        public int id { get; set; }
        public string beneficio { get; set; }
        public double importe { get; set; }
        public DateTime fecha { get; set; }
        public int codigo { get; set; }
        public double importe2 { get; set; }

        public List<TablaPrueba1> detalle = new List<TablaPrueba1>();

    }
}