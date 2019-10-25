using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Modal
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TextoModal.Text = "Mio";
        }

        protected List<T> Boton_Modal()
        {
            List<T> people = new List<T>{
                   new T{id = 1, Nombre = "Scott"},
                   new T{id = 2, Nombre = "Bill"}
                   };

            TextoModal.Text = "Mio";
            return people;
        }

        [WebMethod]
        public void ejecutar()
        {
            TextoModal.Text = "Ejecutar";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextoModal.Text = "Marcelo";
        }
    }
}