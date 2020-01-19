using RubSitio.Comun;
using RubSitio.WrRUBConsultasSP;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Anses.Director.Session;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Text;

namespace RubSitio.Paginas
{
    public partial class ConsultaBenef : PaginaBase
    {
        //DataTable dt;
        int paramEntrada = 0;

        #region variables
        // Para realizar un seguimiento de la anterior fila de grupo     
        string strPreviousRowID = string.Empty;
        // index del grupo sub total    
        int intSubTotalIndex = 1;
        // almaceno temporalmente el Sub Total    
        double dblSubTotalimporteRemu = 0;
        // almaceno temporalmente el Total gral
        double dblGrandTotalimporteRemu = 0;
        #endregion



        #region Eventos Pagina
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!DirectorManager.traerPermiso("OpMenuConsulta", "consultas").HasValue)
            {
                log.Debug(String.Format("Usuario Legajo: {0} - Perfil {1} - No tiene permisos de acceso", Helper.getUsrLegajo(), Helper.getTokenGroups()));
                Response.Redirect("../ErrorAcceso.aspx");
            }

            if (!Page.IsPostBack)
            {
                btnBuscar.Disabled = true;
                this.Silenciar();
                this.log.Debug("Se accede a pagina de ConsultaBenef");
                log.Debug(String.Format("Usuario Legajo: {0}", Helper.getUsrLegajo()));
                log.Debug(String.Format("Usuario Ap.Nom.: {0}", Helper.getTokenNombreUsuario()));
                
            }

            if (!IsPostBack)
            {
                string script = "$(document).ready(function () { $('[id*=lnkPage]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
            }
            
            //DateTime fecha = DateTime.Parse("2015-05-01");
            //var obtenercon = Servicios.ObtnerBenefporCUip(27041537731);
            //txtEntrada.Text = obtenercon.ToString();
        }

        protected void RadioButtonListBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEntrada.Attributes.Add("placeholder", "Seleccione parámetro para la búsqueda");
            txtEntrada.Attributes.Remove("disabled");
            txtEntrada.Text = "";

            switch (RadioButtonListBusqueda.SelectedIndex)
            {
                //Beneficio
                case 0:
                    txtEntrada.Attributes.Add("placeholder", "Ingrese" + RadioButtonListBusqueda.Items[0].Text.Replace("&nbsp", ""));
                    txtEntrada.Attributes.Add("MaxLength", "11");
                    this.txtEntrada.Attributes["OnKeyDown"] = "TabNext(this,'down',11)";
                    this.txtEntrada.Attributes["OnKeyUp"] = "TabNext(this,'up',11," + this.btnBuscar.ClientID + ")";
                    btnBuscar.Disabled = false;
                    //divEncabezado.Attributes.Remove("panel-heading clickable");
                    paramEntrada = 0;
                    break;
                //Cuil
                case 1:
                    txtEntrada.Attributes.Add("placeholder", "Ingrese" + RadioButtonListBusqueda.Items[1].Text.Replace("&nbsp", ""));
                    txtEntrada.Attributes.Add("MaxLength", "11");
                    this.txtEntrada.Attributes["OnKeyDown"] = "TabNext(this,'down',11)";
                    this.txtEntrada.Attributes["OnKeyUp"] = "TabNext(this,'up',11," + this.btnBuscar.ClientID + ")";
                    btnBuscar.Disabled = false;
                    paramEntrada = 1;
                    break;
                //ApNom
                case 2:
                    txtEntrada.Attributes.Add("placeholder", "Ingrese" + RadioButtonListBusqueda.Items[2].Text.Replace("&nbsp", ""));
                    //txtEntrada.Attributes.Add("placeholder", "Opción en desarrollo. Aun no disponible.");
                    txtEntrada.Attributes.Add("MaxLength", "30");
                    this.txtEntrada.Attributes["OnKeyDown"] = "TabNext(this,'down',30)";
                    this.txtEntrada.Attributes["OnKeyUp"] = "TabNext(this,'up',30," + this.btnBuscar.ClientID + ")";
                    btnBuscar.Disabled = false;
                    paramEntrada = 2;
                    break;
                //Documento
                case 3:
                    txtEntrada.Attributes.Add("placeholder", "Ingrese" + RadioButtonListBusqueda.Items[3].Text.Replace("&nbsp", ""));
                    txtEntrada.Attributes.Add("MaxLength", "8");
                    this.txtEntrada.Attributes["OnKeyDown"] = "TabNext(this,'down',8)";
                    this.txtEntrada.Attributes["OnKeyUp"] = "TabNext(this,'up',8," + this.btnBuscar.ClientID + ")";
                    btnBuscar.Disabled = false;
                    paramEntrada = 3;
                    break;
                //Cuil Causante
                case 4:
                    txtEntrada.Attributes.Add("placeholder", "Ingrese" + RadioButtonListBusqueda.Items[4].Text.Replace("&nbsp", ""));
                    txtEntrada.Attributes.Add("MaxLength", "11");
                    this.txtEntrada.Attributes["OnKeyDown"] = "TabNext(this,'down',11)";
                    this.txtEntrada.Attributes["OnKeyUp"] = "TabNext(this,'up',11," + this.btnBuscar.ClientID + ")";
                    btnBuscar.Disabled = false;
                    paramEntrada = 4;
                    break;

                default: break;
            }
        }
        
        #endregion Eventos Pagina

        #region Eventos Grilla

        private void CargarGrillaBeneficios(List<Beneficios> beneficios)
        {            
            gv_Beneficios.DataSource = beneficios;
            gv_Beneficios.DataBind();
            Session["Datos_gv_Beneficios"] = beneficios;
            divResultados.Style.Add("display", "block");
        }

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
            Int32 index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Select"))
            {
                GridViewRow row;
                if (gv_Beneficios.PageIndex == 0)
                {
                    row = gv_Beneficios.Rows[index];
                }
                else
                {
                    Int32 totalPag = Convert.ToInt32(gv_Beneficios.PageCount);
                    Int32 itemActual = (totalPag - (totalPag - Convert.ToInt32(gv_Beneficios.PageIndex))) * Convert.ToInt32(gv_Beneficios.PageSize);
                    row = gv_Beneficios.Rows[index - itemActual];
                }
                DataKey key = gv_Beneficios.DataKeys[row.RowIndex];

                // Creo una ListItem     
                ListItem beneficio = new ListItem();
                ListItem documento = new ListItem();

                beneficio.Text = Server.HtmlDecode(row.Cells[2].Text);
                documento.Text = Server.HtmlDecode(row.Cells[7].Text);

                // Obtengo el id de la entidad que se esta seleccionando                    
                DataBoundControl nroBenef = (DataBoundControl)gv_Beneficios.Rows[index].FindControl("beneficio");
                DataBoundControl nroDoc = (DataBoundControl)gv_Beneficios.Rows[index].FindControl("nroDoc");


                DatosPersonaBenef datosPersonaBenef = Servicios.TraerDatosPersonaBenef(long.Parse(beneficio.Text));
                OtrosDatosBenef otrosDatosBenef = Servicios.TraerOtrosDatosBenef(long.Parse(beneficio.Text));
                RUBConceptosTot[] datosConceptos = Servicios.ObtenerTodosConceptos(long.Parse(beneficio.Text));

                if (datosPersonaBenef.error.codError == 999 && otrosDatosBenef.error.codError == 999)
                {
                    this.Alertar("Error en el servicio. No se encontraron datos para el beneficio seleccionado");
                    log.Error(string.Format("No hay datos para el beneficio ingresado -> Error:{0}->", System.Diagnostics.TraceEventType.Error));
                    return;
                }
                else
                {

                    if (datosPersonaBenef.error.codError == 0 || otrosDatosBenef.error.codError == 0)
                    {
                        try
                        {
                            //cargo datos
                            CargarDatosPersona(datosPersonaBenef);
                            CargarDatosBeneficio(datosPersonaBenef);
                            CargarDatosAdicionales(otrosDatosBenef, decimal.Parse(documento.ToString()), decimal.Parse(beneficio.ToString()));
                            if(datosConceptos != null)
                            {
                                CargarConceptos(datosConceptos);
                            }
                            divDatosPersona.Style.Add("display", "block");
                            gv_Beneficios.Enabled = false;
                            this.btnLimpiarResultado.Disabled = true;
                            divResultados.Style.Add("display", "block");
                            divCollapseBeneficios.Attributes.Add("class", "panel-info panel-collapse collapse");
                            divPrimarioBenef.Attributes.Add("class", "panel panel-info");
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }

                    }
                    else
                    {   // dio otro error diferente a 999
                        this.Alertar(datosPersonaBenef.error.mensajeError);
                        log.Error(string.Format("No hay datos para el beneficio ingresado -> Error:{0}->", System.Diagnostics.TraceEventType.Error));
                        return;
                    }                    
                }
            }
        }

        private void ValidarListaBeneficios(List<Beneficios> beneficios)
        {
            if (beneficios.Count == 1 && beneficios[0].error.codError == 999)
            {   
                Alertar("No hay datos para el parámetro ingresado.");
                btnBuscar.Disabled = true;
                btnLimpiarParametros.Disabled = false;
                //divCollapseParam.Attributes.Add("class", "panel-collapse collapse in");
                //divPrimarioParam.Attributes.Add("class", "panel panel-info");
                return;
            }

/*
            if (beneficios == null)
            {
                this.Alertar("Ocurrió un error en el servicio, por favor intente nuevamente en unos minutos.");
                btnBuscar.Disabled = true;
                btnLimpiarParametros.Disabled = false;
                return;
            }
*/
            btnBuscar.Disabled = true;
            divCollapseParam.Attributes.Add("class", "panel-collapse collapse");
            divPrimarioParam.Attributes.Add("class", "panel panel-info");
            CargarGrillaBeneficios(beneficios);
        }

        #region grilla conceptos


        protected void gv_Conceptos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TODO: CargarGrilla
        }


        protected void gv_Conceptos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Int32 index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Select"))
            {
                GridViewRow row;
                if (gv_Beneficios.PageIndex == 0)
                {
                    row = gv_Beneficios.Rows[index];

                    GridView3.DataSource = "";
                    GridView3.DataBind();
                    GridView3.Visible = true;
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalConceptos", "$('#ModalConceptos').modal();", true);
                    //upModal.Update();

                }
                else
                {
                    Int32 totalPag = Convert.ToInt32(gv_Beneficios.PageCount);
                    Int32 itemActual = (totalPag - (totalPag - Convert.ToInt32(gv_Beneficios.PageIndex))) * Convert.ToInt32(gv_Beneficios.PageSize);
                    row = gv_Beneficios.Rows[index - itemActual];
                }
                DataKey key = gv_Beneficios.DataKeys[row.RowIndex];


                var Texto = Server.HtmlDecode(row.Cells[1].Text);
                //var seggrilla = obtenerconcep(Texto);


                //GridView3.DataSource = seggrilla.ToList();
                //GridView3.DataBind();
                //GridView3.Visible = true;
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalConceptos", "$('#ModalConceptos').modal();", true);
                //upModal.Update();
            }
        }

        protected void gv_Conceptos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //bool EsSubTotalRowToAdd = false;
            //bool EsTotalRowToAdd = false;

            
            if ((strPreviousRowID == string.Empty) && (DataBinder.Eval(e.Row.DataItem, "beneficio") != null))
            {
                GridView gv_Beneficios = (GridView)sender;
                string detImportes = "";
                GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                TableCell cell = new TableCell();
                cell.Text = "Mensual : " + DataBinder.Eval(e.Row.DataItem, "FechaEmision").ToString() +
                    "Periodo : " + DataBinder.Eval(e.Row.DataItem, "FechaLiquidacion").ToString() +
                    "Tipo Liq : " + DataBinder.Eval(e.Row.DataItem, "DescriCausaSuspen");
                cell.ColumnSpan = 4;
                cell.CssClass = "GroupHeaderStyle";
                row.Cells.Add(cell);

                GridViewRow row2 = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                TableCell cell2 = new TableCell();
                cell2.Text = "Estado : " + DataBinder.Eval(e.Row.DataItem, "Detalle[0].Concepto") + 
                    "Total :  $ " + DataBinder.Eval(e.Row.DataItem, "ImporteNeto").ToString();
                cell2.ColumnSpan = 4;
                cell2.CssClass = "GroupHeaderStyle";
                row2.Cells.Add(cell2);

                var deta2 = DataBinder.Eval(e.Row.DataItem, "Detalle");
                var detaLong = ((RubSitio.WrRUBConsultasSP.RUBConcepto[])(deta2)).Length;
                for (int i = 0; i < detaLong; i++)
                {
                    detImportes = detImportes + " " + ((RubSitio.WrRUBConsultasSP.RUBConcepto[])(deta2))[i].ImporteLiquidado.ToString() + " - " + ((RubSitio.WrRUBConsultasSP.RUBConcepto[])(deta2))[i].Concepto +
                        ((RubSitio.WrRUBConsultasSP.RUBConcepto[])(deta2))[i].Empresa;
                }
                GridViewRow row3 = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                TableCell cell3 = new TableCell();
                cell3.Text = detImportes;
                cell3.ColumnSpan = 4;
                cell3.CssClass = "GroupHeaderStyle";
                row3.Cells.Add(cell3);

                gv_Beneficios.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row);
                intSubTotalIndex++;
                gv_Beneficios.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row2);
                intSubTotalIndex++;
                gv_Beneficios.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row3);
                intSubTotalIndex++;

            }
        }
        #endregion grilla conceptos




        #region parseo datos

        private void CargarDatosPersona(DatosPersonaBenef datosPersonaBenef)
        {
            DateTime fAltaLiq = (Convert.ToDateTime(datosPersonaBenef.fAltaLiq).Date);
            DateTime fComparar = new DateTime(2009, 02, 01);

            lblCuil.Text = datosPersonaBenef.cuil.ToString("00-00000000-0");
            lblBeneficio.Text = datosPersonaBenef.beneficio.ToString("00-0-0000000-0");
            lblApNom.Text = datosPersonaBenef.apellNombre.ToString();
            lblTyNroDoc.Text = (datosPersonaBenef.tipoDoc + "- " + datosPersonaBenef.nroDoc).ToString();
            lblSexo.Text = (datosPersonaBenef.sexo.ToString().ToUpper() == "F") ? "Femenino" : (datosPersonaBenef.sexo.ToString().ToUpper() == "M") ? "Masculino" : datosPersonaBenef.sexo.ToString();
            lblFNac.Text = datosPersonaBenef.fNacimiento.ToString("dd/MM/yyyy");
            lblNacion.Text = (datosPersonaBenef.nacionalidad.ToString().ToUpper() == "A") ? "Argentina" : (datosPersonaBenef.nacionalidad.ToString().ToUpper() == "E") ? "Extranjera" : "No Informada";
            lblEstCiv.Text = string.IsNullOrEmpty(datosPersonaBenef.dEstCivil) ? "Estado Civil no Hallado" : (datosPersonaBenef.estCivil + " - " + datosPersonaBenef.dEstCivil).ToString();
            //lblFAlta.Text = (datosPersonaBenef.fAltaLiq.ToString("dd/MM/yyyy") > "01/02/2009") ?;            
            lblFAlta.Text = (fAltaLiq > fComparar) ? "" : "02/2009";
            lblCondEsp.Text = (datosPersonaBenef.cCondEspecial == 0) ? "" : datosPersonaBenef.dCausaVtoBen.ToString();
            lblFApropCuil.Text = (datosPersonaBenef.fApropCuil != DateTime.MinValue) ? datosPersonaBenef.fApropCuil.ToString("dd/MM/yyyy") : "";
        }

        private void CargarDatosBeneficio(DatosPersonaBenef datosPersonaBenef)
        {
            lblRegJub.Text = (datosPersonaBenef.dOrg.ToString() == "") ? "-" : datosPersonaBenef.dOrg.ToString();
            lblClaseBenef.Text = (datosPersonaBenef.daClaseBenef.Substring(1) + " - " + datosPersonaBenef.dClaseBenef);
            lblCuilCausante.Text = (datosPersonaBenef.cuilCausante.ToString() == null) ? "-" : (datosPersonaBenef.cuilCausante.ToString() == "0") ? "-" : datosPersonaBenef.cuilCausante.ToString("00-00000000-0");
            lblBcoAgen.Text = (datosPersonaBenef.codBco + " - " + datosPersonaBenef.codAge.ToString("000") + " - " + datosPersonaBenef.dAgencia);
            lblExpIniciado.Text = (datosPersonaBenef.cOrg.ToString() == null) ? "-" : (datosPersonaBenef.cOrg.ToString() == "0") ? "-" : (datosPersonaBenef.cOrg + " - " + datosPersonaBenef.preCuil + " - " + datosPersonaBenef.docCuil + " - " + datosPersonaBenef.docCuil + " - " + datosPersonaBenef.cTipo + " - " + datosPersonaBenef.cSeq);
            lblLeyAplic.Text = datosPersonaBenef.daLey.ToString() + " - " + datosPersonaBenef.descLey.ToString();
            lblHaberReal.Text = datosPersonaBenef.haberReal.ToString();
            lblHabRealRec.Text = datosPersonaBenef.haberRealRecup.ToString();
            lblPorcBenef.Text = datosPersonaBenef.porcBenef.ToString();
            lblPorcComp.Text = datosPersonaBenef.porcComputo.ToString();
            lblFInicialPag.Text = datosPersonaBenef.fInPago.ToString("dd/MM/yyyy");
            lblCausaVenc.Text = (datosPersonaBenef.cCausaVtoBen != 0) ? datosPersonaBenef.cCausaVtoBen + " - " + datosPersonaBenef.dCausaVtoBen.ToString() : "";
            lblMarcTope.Text = (datosPersonaBenef.cMcaTopesLmn + " - " + datosPersonaBenef.dTopeBenef);
            lblLiqEsp.Text = datosPersonaBenef.desCondEsp;
            lblCodPago.Text = (datosPersonaBenef.codPago + " - " + datosPersonaBenef.descPago);
            lblBenefMult.Text = (datosPersonaBenef.cBenMultiple + " - " + datosPersonaBenef.dBenMultiple);
            lblCajaOt.Text = (datosPersonaBenef.cCajaOtorgante + " - " + datosPersonaBenef.dCajaOtorgante);
            lblCondEsp.Text = (datosPersonaBenef.cCondEspecial.ToString() == null) ? "" : (datosPersonaBenef.daCondEsp + " - " + datosPersonaBenef.desCondEsp);

            lblModalPago.Text = (datosPersonaBenef.daModalPago.ToString() == null) ? "" : (datosPersonaBenef.daModalPago + " - " + datosPersonaBenef.dModalPago);
        }

        private void CargarDatosAdicionales(OtrosDatosBenef otrosDatosBenef, decimal documento, decimal beneficio)
        {
            lblMarcaLuzFza.Text = (otrosDatosBenef.mLuzyFuerza == null || otrosDatosBenef.mLuzyFuerza.ToString() == "N") ? "No Informado" : (otrosDatosBenef.mLuzyFuerza.ToString() == "S") ? otrosDatosBenef.daCondEspecial + " - " + otrosDatosBenef.descCondEspecial : "";
            lblMarcaRetiro.Text = (otrosDatosBenef.daRetiro + " - " + otrosDatosBenef.descRetiro);
            lblTipoDocente.Text = (otrosDatosBenef.cTipoDocente.ToString() != null) ? (otrosDatosBenef.daCondEspecial + " - " + otrosDatosBenef.descCondEspecial) : "";
            if ((Servicios.ConsultarCantBeneficios(documento).cantBenef) == 1) { lblBenefIgualDoc.Text = "NO"; }
            else { lblBenefIgualDoc.Text = "SI"; }
            lblFAumLeyComun.Text = (otrosDatosBenef.fAumLeyComun.Year < 1900) ? "" : otrosDatosBenef.fAumLeyComun.ToString("dd/MM/yyyy");
            lblFAumLeyEsp.Text = otrosDatosBenef.fAumLeyEsp.ToString("dd/MM/yyyy");
            lblSumaHaber.Text = otrosDatosBenef.iHabBasico.ToString();
            lblHaberMax.Text = (otrosDatosBenef.iHabMax.ToString() == null) ? otrosDatosBenef.iHabBasico.ToString() : (otrosDatosBenef.iHabMax.ToString() == "0") ? otrosDatosBenef.iHabBasico.ToString() : otrosDatosBenef.iHabMax.ToString();
            if ((Servicios.ConsultarEmbargos(beneficio).digCuil) == 0) { lblPresEmbCtasAns.Text = "NO"; }
            else { lblPresEmbCtasAns.Text = "SI"; }
            //lblFApropCuil.Text = "NO ESTA EN DATO O EN SELECT";
            lblCondicAlta.Text = otrosDatosBenef.condAlta;
            lblMarcaDec2196.Text = otrosDatosBenef.codDec2196.ToString();
            lblAfjp.Text = otrosDatosBenef.codAfjp.ToString();
            
            //if (otrosDatosBenef.codDec2196 > 0) { lblMarcaDec2196.Text = Servicios.ConsultarDecreto2196(otrosDatosBenef.codDec2196.ToString()); }
        }

        private void CargarConceptos(RUBConceptosTot[] datosConceptos)
        {

            //var result = from p in datosConceptos
            //             group p by p.FechaLiquidacion into g
            //             select new RUBConcepto



            //RUBConcepto[] result = datosConceptos
            //     .GroupBy(l => l.FechaLiquidacion, l => l.FechaEmision)
            //     .SelectMany(cl => cl.Select(
            //         csLine => new elotro
            //         {
            //             FechaLiquidacion = csLine.FechaLiquidacion,
            //             ImporteLiquidado = cl.Sum(c => c.impo),
            //         })).ToList<RUBConcepto>();

           

            //GridView3.Visible = false;
            //lblCont.Text = result.Count().ToString();
            gv_Conceptos.DataSource = datosConceptos.ToList();
            gv_Conceptos.DataBind();

            //rptResult.DataSource = result.ToList();
            //rptResult.DataBind();

            
            //lblConceptoBen.Text = datosConceptos[0].Beneficio.ToString();
        }

        protected void CargaDetalleConceptos(object sender, EventArgs e)
        {
            int paramConcep = int.Parse((sender as Button).CommandArgument);
            //Llama al detalle con el paramConcep 
            //GeneraPaginacion(pageIndex);

        }

        //[WebMethod]
        //protected void DameContactos()
        //{
        //    var jsonSerialiser = new JavaScriptSerializer();
        //    RUBConcepto[] datosConceptos = Servicios.ObtenerTodosConceptos(decimal.Parse(lblBeneficio.Text));
        //    losdatosconcep = jsonSerialiser.Serialize(datosConceptos.ToList());
        //    //string eljson = json;
        //    //etijson.Text = eljson;
        //    //return losdatosconcep;
        //}

        //protected string FiltraContactos()
        //{
        //    var jsonSerialiser = new JavaScriptSerializer();
        //    RUBConcepto[] datosConceptos = Servicios.ObtenerTodosConceptos(decimal.Parse(lblBeneficio.Text));
        //    losdatosconcep = jsonSerialiser.Serialize(datosConceptos.ToList());
        //    //string eljson = json;
        //    //etijson.Text = eljson;
        //    return losdatosconcep;
        //}

        #endregion parseo datos

        #endregion Eventos Grilla

        #region botones

        protected void BtnBuscar_ServerClick(object sender, EventArgs e)
        {
            paramEntrada = RadioButtonListBusqueda.SelectedIndex;            
            RadioButtonListBusqueda.Enabled = false;
            btnLimpiarParametros.Disabled = true;
            

            try
            {
                switch (paramEntrada)
                {
                    //Consulta por Beneficio
                    #region Beneficio
                    case (int)enum_accion.beneficio:

                        if (!Funciones.EsNumerico(txtEntrada.Text))
                        {
                            this.Alertar("Error al validar Nro. de Beneficio ingresado");
                            btnBuscar.Disabled = true;
                            btnLimpiarParametros.Disabled = false;
                            return;
                        }
                        string ben = Convert.ToString(txtEntrada.Text);
                        int largo = ben.Length;

                        if (largo == 10)
                        {
                            ben = "0" + ben;
                            largo = 11;
                            txtEntrada.Text = (long.Parse(ben)).ToString();
                        }

                        if (largo < 10 || largo > 11)
                        {
                            Alertar("Error al validar Nro. de Beneficio ingresado");
                            btnBuscar.Disabled = true;
                            btnLimpiarParametros.Disabled = false;
                            return;
                        }

                        if (largo == 11)
                        {
                            //Nro Beneficio válido-- Llamo al servicio
                            List<Beneficios> beneficios = Servicios.ConsultaBeneficioxBenef((long.Parse(ben)));
                            ValidarListaBeneficios(beneficios);
                            
                           // CargarGrillaBeneficios(beneficios);
                        }

                        break;
                    #endregion Beneficio
                    //Consulta por cuil
                    #region CUIL
                    case (int)enum_accion.cuil:

                        if (!Funciones.EsNumerico(txtEntrada.Text))
                        {
                            Alertar("Error al validar Nro. de CUIL ingresado");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }

                        else if (!Funciones.VerificarCuil(txtEntrada.Text))
                        {
                            Alertar("El CUIL ingresado es incorrecto");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }


                        else
                        {
                            List<Beneficios> beneficios = Servicios.ConsultarBeneficiosxCuil(decimal.Parse(txtEntrada.Text));
                            ValidarListaBeneficios(beneficios);                            
                        }
                        
                        break;
                    #endregion CUIL
                    //Consulta por Apellido y Nombre
                    #region ApyNom
                    case (int)enum_accion.apNom:

                        if (!Funciones.EsTextoIngresado(txtEntrada.Text))
                        {
                            this.Alertar("Debe ingresar caracteres alfabéticos");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }
                        
                        else
                        {
                            //List<Beneficios> beneficios = Servicios.ConsultarBeneficiosxApNom((txtEntrada.Text).ToString());
                            //ValidarListaBeneficios(beneficios);
                            Session["Paginacion"] = txtEntrada.Text;
                            GeneraPaginacion(1);
                        }
                    
                    break;
                    #endregion ApyNom
                    //Consulta por Documento                    
                    #region Documento

                    case (int)enum_accion.docum:

                        if (!Funciones.EsNumerico(txtEntrada.Text))
                        {
                            this.Alertar("Error al validar Nro. de Documento ingresado");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }
                        else
                        {
                            //Nro Docum válido-- Llamo al servicio
                            List<Beneficios> beneficios = Servicios.ConsultaBeneficioxDocum((decimal.Parse(txtEntrada.Text)));
                            ValidarListaBeneficios(beneficios);                            
                        }

                        break;
                    #endregion Beneficio
                    //Consulta por Cuil Causante
                    #region CUIL Causante
                    case (int)enum_accion.cuilCausante:

                        if (!Funciones.EsNumerico(txtEntrada.Text))
                        {
                            this.Alertar("Error al validar Nro. de CUIL ingresado");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }

                        else if (!Funciones.VerificarCuil(txtEntrada.Text))
                        {
                            this.Alertar("El CUIL ingresado es incorrecto");
                            btnLimpiarParametros.Disabled = false;
                            btnBuscar.Disabled = true;
                            return;
                        }

                        else
                        {
                            List<Beneficios> beneficios = Servicios.ConsultarBeneficiosxCuilCausante(decimal.Parse(txtEntrada.Text));
                            ValidarListaBeneficios(beneficios);                            
                        }

                        break;
                    #endregion CUIL Causante

                    default: break;

                }
            }
            catch (Exception)
            {
                throw;
            }

        }

       
        protected void BtnLimpiarParam_ServerClick(object sender, EventArgs e)
        {
            Silenciar();
            Response.Redirect("~/Paginas/ConsultaBenef.aspx");
        }

        protected void BtnLimpiarResult_ServerClick(object sender, EventArgs e)
        {
            Silenciar();
            gv_Beneficios.DataSource = null;
            gv_Beneficios.DataBind();            
            Response.Redirect("~/Paginas/ConsultaBenef.aspx");
        }

        protected void BtnLimpiarDatPers_ServerClick(object sender, EventArgs e)
        {
            Silenciar();
            gv_Beneficios.DataSource = null;
            gv_Beneficios.DataBind();
            Response.Redirect("~/Paginas/ConsultaBenef.aspx");
        }



        #endregion botones

        enum enum_accion
        {
            beneficio = 0,
            cuil = 1,
            apNom = 2,
            docum = 3,
            cuilCausante = 4
        }


        //Generación de botones para paginar cuando se busca x nombre
        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as Button).CommandArgument);
            GeneraPaginacion(pageIndex);
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / 10);
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("Primera", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    if(i <= 10)
                    {
                        pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                }
                if(pageCount > 10)
                {
                    pages.Add(new ListItem("...", currentPage.ToString(), false));
                }
                pages.Add(new ListItem("Ultima", pageCount.ToString(), currentPage < pageCount));
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }

        private void GeneraPaginacion(int pageIndex)
        {
            //(txtEntrada.Text).ToString()
            if (Session["Paginacion"] != null)
            {
                txtEntrada.Text = Session["Paginacion"].ToString();
            }

            List<Beneficios> beneficios = Servicios.ConsultarBeneficiosxApNomPaginado((txtEntrada.Text).ToString(), pageIndex, 10);
            var total = beneficios[0].regCant;
            ValidarListaBeneficios(beneficios);
            PopulatePager(total, pageIndex);
        }

        
    }
   
}

