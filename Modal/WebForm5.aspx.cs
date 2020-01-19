using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Modal
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            string CadenaConexion = ConfigurationManager.ConnectionStrings["myConexion"].ConnectionString;


            using (var Conn = new SqlConnection(CadenaConexion))
            {
                //SqlConnection Conn = new SqlConnection(CadenaConexion);
                Conn.Open();


                using (var Cmd2 = new SqlCommand("select * from TablaPrueba1", Conn))
                {
                    //Cmd2.CommandType = CommandType.StoredProcedure;
                    //Cmd.Parameters.AddWithValue("@Operacion", "X");
                    //Cmd.Parameters.AddWithValue("@id", 2);


                    using (var dr2 = Cmd2.ExecuteReader())
                    {
                        if (dr2.HasRows)
                        {
                            using (var dt2 = new DataTable())
                            {
                                dt2.Load(dr2);

                                List<TablaPrueba1> studentList1 = new List<TablaPrueba1>();
                                for (int a = 0; a < dt2.Rows.Count; a++)
                                {
                                    TablaPrueba1 student1 = new TablaPrueba1();
                                    student1.id = Convert.ToInt16(dt2.Rows[a]["id"]); 
                                    student1.descri = dt2.Rows[a]["descri"].ToString();
                                    
                                    studentList1.Add(student1);
                                




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
                                                        student.id = i;
                                                        student.beneficio = dt.Rows[i]["beneficio"].ToString();
                                                        student.importe = Convert.ToDouble(dt.Rows[i]["importe"]);
                                                        student.fecha = Convert.ToDateTime(dt.Rows[i]["fecha"]);
                                                        student.codigo = Convert.ToInt16(dt.Rows[i]["codigo"]);
                                                        if(i == 2)
                                                        {
                                                            student.detalle.Add(student1);
                                                        }
                                                        

                                                        studentList.Add(student);
                                                    }


                                                    gv_Beneficios.DataSource = studentList;
                                                    gv_Beneficios.DataBind();
                                                    //GridView1.DataSource = studentList;
                                                    //GridView1.DataBind();
                                                    Session["Datos"] = studentList;
                                                }
                                            }
                                        }
                                    }

                                }




                            }
                        }
                    }
                }
            }
        }

        protected void gv_Beneficios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //string modalScript = @"<script type=""text/javascript"">
            //    function openModal() {
            //        $('#modalDetalle0').modal('show');
            //    }
            //</script>";
            //ScriptManager.RegisterStartupScript(this, GetType(), "bsChgPwdModal", "modalDetalle0", false);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#modalDetalle0').modal('show');</script>", true);

            List<TablaPrueba> productos = new List<TablaPrueba>();
            if (Session["Datos"] != null)
                productos = (List<TablaPrueba>)Session["Datos"];
            
            GridView1.DataSource = productos[Convert.ToInt32(e.CommandArgument)].detalle.ToList();
            GridView1.DataBind();

            var script = "$(function() { showModalExito(); }); ";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "btnLCDAscript", script, true);
        }

        protected void gv_Beneficios_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TODO: CargarGrilla

        }



        //public void CargarDatos()
        //{
        //    var datos = new ModalTotales({"TotalId": 1,
        //                                    "Nombre": "Marcelo",

        //                                    "lineas": {
        //        "Turning tiny",
        //                                      "Radiation blast"
        //                                    }
        //},
        //                                  {
        //                                    "name": "Madame Uppercut",
        //                                    "age": 39,
        //                                    "secretIdentity": "Jane Wilson",
        //                                    "powers": {
        //                                      "Million tonne punch",
        //                                      "Damage resistance",
        //                                      "Superhuman reflexes"
        //                                    }
        //                                    })
                                          
                                    
        //}
      



        //public class ModalTotales
        //{
        //    public int TotalId { get; set; }
        //    public string Nombre { get; set; }


        //    List<ModelDatos> lineas = new List<ModelDatos>();
        //}


        //public class ModelDatos
        //{
        //    public int Id { get; set; }
        //    public string Apellido { get; set; }
            

        //}
    }
}