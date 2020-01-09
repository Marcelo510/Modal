using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
            var resu = ObtenerDatos();
            List<TablaPrueba> result = resu
                    .GroupBy(l => l.codigo)
                    .Select(cl => new TablaPrueba
                    {
                        codigo = cl.First().codigo,
                        importe = cl.Sum(c => c.importe),
                    }).ToList();

            TablaPrueba cont = new TablaPrueba();
            int n = 1;
            foreach (var item in result)
            {
                cont.id = n;
                //cont.codigo.add(item.codigo;)
                //cont.importe = item.importe;
                
            }



            //var result = ObtenerDatos();
        }

        public void ConsultaLinq(TablaPrueba res)
        {
            
            //var result = ObtenerDatos();
            //var result = ObtenerDatos();
            //var items = from p in result
            //            where result.Contains(p.ItemId)
            //            select p;
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
    }
}