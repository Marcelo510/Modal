using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modal
{
    public class Consulta
    {
        public datos resulta(int para)
        {
            datos res = new datos();
            if(para == 1)
            {
                res.id = 1;
                res.nombre = "Marcelo";
            }
            else
            {
                res.id = 2;
                res.nombre = "Rodrigo";
            }
            
            return res;
        }



        public class datos
        {
            public int id { get; set; }
            public string nombre { get; set; }
        }

    }

    
}