using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Modal
{
    public partial class LINQ : System.Web.UI.Page
    {

        string CadenaConexion = ConfigurationManager.ConnectionStrings["myConexion"].ConnectionString;


       


        protected void Page_Load(object sender, EventArgs e)
        {
            //var resu = ObtenerDatos();
            //result = resu
            //        .GroupBy(l => l.codigo)
            //        .Select(cl => new TablaPrueba
            //        {
            //            codigo = cl.First().codigo,
            //            importe = cl.Sum(c => c.importe),
            //        }).ToList();

            //gv_Beneficios.DataSource = resu;
            //gv_Beneficios.DataBind();

            //GridView1.DataSource = result;
            //GridView1.DataBind();
            

            //StringBuilder sb = new StringBuilder();
            //sb.Append("<table cellpadding='3' cellspacing='3' style='border: 1px solid #800000;font-size: 12pt;font-family:Arial'>");
            ////Add Table Header
            ////sb.Append("<tr>");
            ////foreach (DataColumn column in dt.Columns)
            ////{
            ////    sb.Append("<th style='background-color: #3366ff;border: 1px solid #000'>" + column.ColumnName + "</th>");
            ////}
            ////sb.Append("</tr>");
            ////Add Table Rows
            //foreach (TablaPrueba row in result)
            //{

            //    if (row.codigo == 30)
            //    {
            //        sb.Append("<td><asp:button type='button' class='ladda-button btn btn-primary' runat='server' data-toggle='modal' OnClick='ConsultaLinq' data-target='#modalDetalle0'></asp:button></td>");
            //        sb.Append("<td><asp:button ID='lnkPage2' class='btn btn-primary' runat='server' Text='Det' CommandArgument='25' Enabled='true' OnClick='ConsultaLinq'></asp:button></td>");
            //        sb.Append("<td><button type='button' id='btnLimpiarResultado'  class='btn btn-primary' runat='server' class='btn btn-default' onserverclick='ConsultaLinq'></button></td>");
            //    }
            //    //Add Table Columns

            //    if (row.codigo == 15)
            //    {
            //        sb.Append("<td style='width:100px;border: 1px solid #ccc'><input value='La funcion2' onclick='ConsultaLinq' type='button'></td>");
            //    }
            //    else
            //    {
            //        sb.Append("<td style='width:100px;border: 1px solid #ccc'></td>");
            //    }
            //    sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + row.importe.ToString() + "</td>");
            //    sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + row.codigo.ToString() + "</td>");

            //    sb.Append("</tr>");
            //}
            //sb.Append("</table>");
            //DynamicTable.Text = sb.ToString();



            //var result = ObtenerDatos();
        }

        //private void CargarGrillaBeneficios(List<Beneficios> beneficios)
        //{
        //    gv_Beneficios.DataSource = beneficios;
        //    gv_Beneficios.DataBind();
        //    Session["Datos_gv_Beneficios"] = beneficios;
        //    divResultados.Style.Add("display", "block");
        //}

        protected void gv_Beneficios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_Beneficios.PageIndex = e.NewPageIndex;
            gv_Beneficios.DataSource = Session["Datos_gv_Beneficios"];
            gv_Beneficios.DataBind();
        }

        protected void gv_Beneficios_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TODO: CargarGrilla

        }


        protected void gv_Beneficios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string ver = "";
        }


            
        public TablaPrueba Respuesta()
        {
            
            TablaPrueba lalista = new TablaPrueba();
            //var lalista = HttpContext.Current.Application["someList"] as TablaPrueba;
            //laetiqueta.Text = lalista.codigo.ToString();
            return lalista;
        }

        protected void ConsultaLinq(object sender, EventArgs e)
        {
            // var myList = HttpContext.Current.Application["someList"] as List<string>;
            //var result = ObtenerDatos();
            //var result = ObtenerDatos();
            //var items = from p in result
            //            where result.Contains(p.ItemId)
            //            select p;
            string a = "";
        }

        public List<TablaPrueba> Obtdat()
        {
            var resu = ObtenerDatos();


            return resu;
        }

        public List<TablaPrueba> ObtenerDatos()
        {
            using (var Conn = new SqlConnection(CadenaConexion))
            {
                //SqlConnection Conn = new SqlConnection(CadenaConexion);
                Conn.Open();

                using (var Cmd = new SqlCommand("TraerDatos", Conn))
                {
                    Cmd.CommandType = CommandType.StoredProcedure;
                    //Cmd.Parameters.AddWithValue("@Operacion", "X");
                    //Cmd.Parameters.AddWithValue("@id", 2);

                    using (var dr = Cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            using (var dt = new DataTable())
                            {
                                dt.Load(dr);

                                List<TablaPrueba> studentList = new List<TablaPrueba>();
                                for (int i = 0; i < dt.Rows.Count; i++)
                                {
                                    TablaPrueba student = new TablaPrueba();
                                    student.beneficio = dt.Rows[i]["beneficio"].ToString(); 
                                    student.importe = Convert.ToDouble(dt.Rows[i]["importe"]);
                                    student.fecha = Convert.ToDateTime(dt.Rows[i]["fecha"]);
                                    student.codigo = Convert.ToInt16(dt.Rows[i]["codigo"]);
                                    studentList.Add(student);
                                }



                                //StringBuilder sb = new StringBuilder();
                                //sb.Append("<table cellpadding='3' cellspacing='3' style='border: 1px solid #800000;font-size: 12pt;font-family:Arial'>");
                                //Add Table Header
                                //sb.Append("<tr>");
                                //foreach (DataColumn column in dt.Columns)
                                //{
                                //    sb.Append("<th style='background-color: #3366ff;border: 1px solid #000'>" + column.ColumnName + "</th>");
                                //}
                                //sb.Append("</tr>");
                                //Add Table Rows
                                //foreach (DataRow row in dt.Rows)
                                //{
                                //    if (row.ItemArray[0].ToString() == "3")
                                //    {
                                //        string a = "";
                                //    }
                                //    sb.Append("<tr>");
                                //    //Add Table Columns
                                //    foreach (DataColumn column in dt.Columns)
                                //    {
                                //        sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + row[column.ColumnName].ToString() + "</td>");
                                //    }
                                //    sb.Append("</tr>");
                                //}
                                //sb.Append("</table>");
                                //DynamicTable.Text = sb.ToString();


                                return studentList;
                            }
                        }
                        else
                        {
                            throw new Exception("Error: ");
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<TablaPrueba> resu = new List<TablaPrueba>();
            resu = ObtenerDatos();
            Session["Datos_gv_Beneficios"] = resu;

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            List<TablaPrueba> resu2 = new List<TablaPrueba>();
            var resu = Session["Datos_gv_Beneficios"];

            

            //var result = resu
            //        .GroupBy(l => l.codigo)
            //        .Select(cl => new TablaPrueba
            //        {
            //            codigo = cl.First().codigo,
            //            importe = cl.Sum(c => c.importe),
            //        }).ToList();

        }
    }
}