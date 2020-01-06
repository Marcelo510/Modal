using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


namespace Modal
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //           ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "
            //          < script >$('#mymodal').modal('show');</ script > ", false);
            //}

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var text = Convert.ToInt32(Texto.Text);
            Consulta ver = new Consulta();
            var res = ver.resulta(text);
            segundo.Visible = true;
            eldat.Text = res.nombre;
            elresultado.Visible = true;
            prime.Text = res.nombre;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            LabelTextbox1.Text = TextBox1.Text;
        }
    }
}