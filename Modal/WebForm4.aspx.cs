using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Modal
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLimpiarParam_ServerClick(object sender, EventArgs e)
        {
            Response.Write("<script>var abrirModal = true; </script>");
        }

        protected void BtnPeriodo_ServerClick(object sender, EventArgs e)
        {
            string a = txtmes.Value;


        }
    }
}