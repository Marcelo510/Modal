<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Modal.WebForm2" %>
<%--<%@ Page Language="C#" MasterPageFile="~/comun/MasterPage/base.master" AutoEventWireup="true"
    CodeFile="JUBd.aspx.cs" Inherits="Paginas_JUBd"
        Title="JUbilacón Digital-Datos Solicitante" %>--%>

<%--<%@ Register Src="~/comun/controles/Mensaje.ascx" TagName="Mensaje" TagPrefix="uc2" %>
<%@ MasterType VirtualPath="~/comun/MasterPage/base.master" %>--%>
<%--<%@ Register Assembly="Alert" Namespace="Microsoft.Samples.Alert" TagPrefix="cc1" %>--%>
<asp:Content ID="contenido" ContentPlaceHolderID="ContenedorPrincipal" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
            z-index: auto;
        }

        .fieldset {
            background: #E5F1FD;
            z-index: 1;
            border-width: 0px;
            border-right: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
        }
        .auto-style1 {
            width: 20%;
            height: 20px;
        }
        .auto-style2 {
            height: 20px;
        }
        .auto-style3 {
            height: 83px;
        }
        .auto-style5 {
            margin-bottom: 0px;
        }
        .auto-style6 {
            width: 20%;
        }
        </style>

    <script type="text/javascript" language="javascript">

        //FUNCION TAB PARA CAMPOS TXT
        var field_length = 0;
        function TabNext(obj, event, len, next_field) {

            if (event == "down") {
                field_length = obj.value.length;
            } else if (event == "up") {
                if (obj.value.length != field_length) {
                    field_length = obj.value.length;
                    if (field_length == len) {
                        next_field.focus();
                    }
                }
            }

        }

        function showElement(elemento) {
            document.getElementById(elemento).style.visibility = "visible";
        }
        function hideElement(elemento) {
            document.getElementById(elemento).style.visibility = "hidden";
        }

    </script>
    <script language="javascript" type="text/javascript" src="../Scripts/Funciones.js"></script>
    <%--<cc1:Alert ID="Mensaje1" runat="server" Buttons="OK" OKText="Aceptar" CssClass="botonnavegacion"
        Title="Atencion" HorizontalAlign="center" Width="400px" Height="150px" ForeColor="black"
        Font-Size="12pt" Font-Bold="true" BackgroundCssClass="modalBackground" BackColor="#f4f6e1">
        <br />
        <br />
        <asp:Label ID="lblMensaje" runat="server" CssClass="lblMensajeError" Text=""></asp:Label>
        <br />
        <br />
    </cc1:Alert>--%>
    <script language="javascript" type="text/javascript">
        function autoTab(input, len, e) {
            var keyCode = (isNN) ? e.which : e.keyCode;
            var filter = (isNN) ? [0, 8, 9] : [0, 8, 9, 16, 17, 18, 37, 38, 39, 40, 46];
            if (input.value.length >= len && !containsElement(filter, keyCode)) {
                input.value = input.value.slice(0, len);
                input.form[(getIndex(input) + 1) % input.form.length].focus();
                return true;
            }
        }
    </script>
    <script language="javascript" type="text/javascript">
        function AbrirPopUP() {
            info = 'width=800,height=630,scrollbars=1';
            window.open('../Consulta/CODEM2.aspx', 'ImpresionCodem', info);
        }

        function AbrirPopUP1() {
            //window.open('../Empadronamiento/AyudaOOSS.aspx','AyudaOOSS');
        }
    </script>
    <asp:Panel ID="pnlIngreso" runat="server" Width="100%">
        <br />
        <br />
        <div id="divContenedor" runat="server" class="FondoBlanco" style="height: auto; width: 95%; margin-left: 2%" align="center">
            <div id="divDatos" runat="server" style="text-align: left" align="center">
                <fieldset id="Fieldset1" class="fieldset" runat="server">
                    <h2 style="padding-left:8%">JUBILACIÓN DIGITAL</h2>
                    <table id="Table1" runat="server" style="width: 90%; height: auto; margin-left: 10%">
                        <tr>
                            <td style="width: 15%; text-align: left; padding-left: 10px; height: 20px;">
                                <asp:Label ID="lblCuilSolic" runat="server" Text="CUIL SOLICITANTE:" CssClass="TextoLbl" Width="100%"></asp:Label>
                            </td>
                            <td style="width: 85%; text-align: left; padding-left: 10px; height: 20px">
                                <asp:TextBox ID="txtCuil" runat="server" Style="text-align: center" Width="20%" CssClass="CajaTexto" MaxLength="11" TabIndex="1" ToolTip="Ingrese el CUIL del solicitante sin guiones"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 15%; text-align: left; padding-left: 10px; height: 5px;"></td>
                            <td style="width: 85%; color: Gray; font-size: 10px; text-align: left; padding-left: 10px; height: 5px">
                                <asp:Label ID="Label2" runat="server" Text="Ingrese el CUIL sin guiones" Width="100%"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div ></div>
                    <div id="Botonera" runat="server">
                        <table id="Table2" runat="server" style="width: 90%; height: auto; margin-left: 10%;">
                            <tr>
                      <%--          <td align="left" colspan="3" style="padding-left: 160px;" valign="top">
                                    <asp:CustomValidator ID="cusTxtCuil" runat="server" ClientValidationFunction="isCuit"
                                        ControlToValidate="txtCuil" CssClass="lblMensajeError" Display="None" ErrorMessage="CUIL invalido - Verifique y Reintente"
                                        OnServerValidate="ServerValidateCuil" ValidateEmptyText="true"></asp:CustomValidator>
                                    <script language="javascript" type="text/javascript">

                                        function isCuit(source, args) {
                                            var suma;
                                            var resto;
                                            var verif;
                                            nro = args.Value; // document.getElementById("<%=txtCuil.ClientID%>").value;
                                            args.IsValid = false;

                                            var pos = nro.split("");
                                            if (!/^\d{11}$/.test(nro)) return false;

                                            var y = 0;
                                            while (y < pos.length) {
                                                suma = (pos[0] * 5 + pos[1] * 4 + pos[2] * 3 + pos[
                                            3] * 2 + pos[4] * 7 + pos[5] * 6 + pos[6] * 5 + pos[7] *
                                            4 + pos[8] * 3 + pos[9] * 2);
                                                resto = suma % 11;
                                                if (resto == 0) {
                                                    verif = 0;
                                                    break;
                                                }
                                                else if (resto == 1 && (pos[1] == 0 || pos[6] == 7)) {
                                                    pos[1] = 4;
                                                    continue;
                                                }
                                                else {
                                                    verif = 11 - resto;
                                                    break;
                                                }
                                                y += 1;
                                            }
                                            args.IsValid = (pos[10] == verif);
                                            return;
                                        }
                                    </script>
                                    <asp:ValidationSummary ID="vsummary" runat="server" CssClass="lblMensajeError" DisplayMode="List" />
                                    &nbsp;--%>
                        <%--<asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>--%>
                                <%--    &nbsp;
                                </td>--%>
                                <td align="right" style="height: 10px; padding-top: 5px; padding-right: 30%; padding-bottom: 5px">
                                    <asp:Button ID="btnBuscar" runat="server" CssClass="botonnavegacion" SkinID="Ingresar" OnClick="btnBuscar_Click" Text="Buscar" Height="25px" Width="123px" Enabled="True" TabIndex="4" />&nbsp;                            
                                </td>
                            </tr>
                        </table>

                    </div>

                </fieldset>
            </div>
        </div>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="pnlDatosGenerales" runat="server" Width="100%">
        <div id="divDatosSolicitante" runat="server" class="FondoBlanco" style="height: auto; width: 95%; margin-left: 2%" align="center">            
            <div id="div1" runat="server" style="text-align: left" align="center">
                <fieldset id="Fieldset2" class="fieldset" style=" padding-left: 8%;" runat="server">
                    <h2>DATOS SOLICITANTE</h2>
                    <div class="panel panel-default">
                        <div class="collapse in" id="collapse1">
                            <div class="panel-body">                              
                                <table class="auto-style3" >
                                    <tr style="white-space: nowrap">
                                        <td align="right" class="auto-style1"><strong>Apellido y Nombre:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="lblApeYNom" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; width: 20%"><strong>Cuil Solicitante:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblCuil" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" class="auto-style1"><strong>F.Solicitud JUBD:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle" class="auto-style2">&nbsp;<asp:Label ID="LblFSolic" runat="server"></asp:Label></td>
                                        <td align="right" class="auto-style1"><strong>F.Inicial SICAM:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle" class="auto-style2">&nbsp;<asp:Label ID="LblFInicial" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" class="auto-style1"><strong>Estado del Tramite:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblEstadoTramite" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; width: 20%"><strong>Causa:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblCausa" runat="server"></asp:Label></td>
                                    </tr>
                                   <tr>
                                    <td class="auto-style6"></td><td class="auto-style6"></td><td class="auto-style6"></td>
                                    <td><asp:DataGrid ID="dg_Rechazos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="16px" CssClass="auto-style5">
                                        <AlternatingItemStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundColumn DataField="d_error" HeaderText="Motivo de rechazo">
                                                <HeaderStyle Height="20px" Width="30%" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <EditItemStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        <ItemStyle BackColor="#EFF3FB" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataGrid></td>                            
                                     </tr>
                                </table>
                               
                         
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <br />
        <div id="divDatosExpediente" runat="server" visible="false" class="FondoBlanco" style="height: auto; width: 95%; margin-left: 2%" align="center">
            <div id="div4" runat="server" style="text-align: left" align="center">                
                <fieldset id="Fieldset3" class="fieldset" style="height: 120px; padding-left: 8%;" runat="server">
                    <h2>DATOS DEL EXPEDIENTE</h2>
                    <div class="panel panel-default">
                        <div class="collapse in" id="collapse2">
                            <div class="panel-body">
                                <table class="table table-hover table-striped table-bordered table-condensed active">
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; width: 20%"><strong>Expediente:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblExpediente" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; width: 20%"><strong>Estado:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblEstado" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; width: 20%"><strong>Oficina:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblOficina" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlDatosLiq" runat="server" Width="100%">
        <div id="divDatosLiq" class="FondoBlanco" style="height: auto; width: 95%; margin-left: 2%" align="center">            
            <div id="div6" runat="server" style="text-align: left" align="center">
                <fieldset id="Fieldset4" class="fieldset" style="height: 145px; padding-left: 8%;" runat="server">
                    <h2>DATOS DE LA LIQUIDACION</h2>
                    <div class="panel panel-default">                        
                                <table width="55%">
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; "><strong>Beneficio:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblBeneficio" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>Haber Mensual:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblHaberMen" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>Porc.Beneficio:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblPorcBen" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; "><strong>Haber Retroactivo:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblHaberRetro" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>OOSS Mensual:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblOOSS" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>Desc.OOSS:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblDescOOSS" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; "><strong>Banco:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblBanco" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>Fecha Alta:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblFAlta" runat="server"></asp:Label></td>
                                        <td align="right" style="height: 20px; "><strong>Cant.Cuotas:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="LblCantCuotas" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; "><strong>Imp.Cuota:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; width: 16%; vertical-align: middle">&nbsp;<asp:Label ID="LblImpCuota" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>                      
                </fieldset>
            </div>
        </div>
        <br />
        <div id="divControlPagos" class="FondoBlanco" style="height: auto; width: 95%; margin-left: 2%" align="center">            
            <div id="div8" runat="server" style="text-align: left" align="center">
                <fieldset id="Fieldset5" class="fieldset" style="height: 100px; padding-left: 8%;" runat="server">
                    <h2>CONTROL DE PAGOS</h2>
                    <div class="panel panel-default">
                        <div class="collapse in" id="collapse4">
                            <div class="panel-body">
                                <table>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; width: 20%"><strong>Estado:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="lblEstadoCP" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr style="white-space: nowrap">
                                        <td align="right" style="height: 20px; width: 20%"><strong>Causa:&nbsp;</strong></td>
                                        <td style="border-left: 0px; border-right: 0px; vertical-align: middle">&nbsp;<asp:Label ID="lblCausaCP" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </asp:Panel>
    <br />
    <div id="divBotonera" runat="server" visible="false">
        <table cellpadding="0" cellspacing="0" border="0" style="text-align: left" width="98%">
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnVolver" runat="server" SkinID="Volver" OnClick="btnVolver_Click"
                        Height="26px" Width="100px" Text="Volver" CssClass="botonnavegacion" />
                </td>
            </tr>
        </table>
    </div>
    <br />

    <%--<uc2:Mensaje ID="mensaje" runat="server" />--%>
</asp:Content>

