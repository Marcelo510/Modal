<%@ Page Title="" Language="C#" MasterPageFile="~/Comun/Anses.Master" AutoEventWireup="true" CodeBehind="ConsultaBenef.aspx.cs" Inherits="RubSitio.Paginas.ConsultaBenef" %>



<asp:Content ID="Content2" ContentPlaceHolderID="cphCamino" runat="server">

    <!--Mapa-->
    <ol class="camino">
        <li><a runat="server" href="~/Default.aspx">Inicio</a></li>
        <li>Consultar</li>
        <li class="active">Beneficios</li>

    </ol>
</asp:Content>
<%--<asp:Content ID="titulo" ContentPlaceHolderID="cphTitulo" runat="server">   
        <h4>Beneficios</h4>
</asp:Content>--%>


<asp:Content ID="Content4" ContentPlaceHolderID="cphPrincipal" runat="server">
    <!--PARAMETROS BUSQUEDA --->
    <div id="divParametros" class="col-md-13">
        <div id="divPrimarioParam" class="panel panel-primary" runat="server">
            <div id="divEncabezado" class="panel-heading" runat="server">
                <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion">Parámetros de búsqueda:</h4>
            </div>
            <div id="divCollapseParam" runat="server" class="panel-body panel-collapse collapse in">
                <div class="row">
                    <div class="col-md-3">
                        <div class="radio">
                            <asp:RadioButtonList ID="RadioButtonListBusqueda" CssClass="radio" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RadioButtonListBusqueda_SelectedIndexChanged">
                                <asp:ListItem Value="XBeneficio" Text="&nbsp &nbsp  Número de Beneficio" />
                                <asp:ListItem Value="XCuil" Text="&nbsp &nbsp Número de Cuil" />
                                <asp:ListItem Value="XApNom" Text="&nbsp &nbsp  Apellido y Nombre" />
                                <asp:ListItem Value="XDoc" Text="&nbsp &nbsp  Número de Documento" />
                                <asp:ListItem Value="XCuilCaus" Text="&nbsp &nbsp  Número de Cuil Causante" />
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <asp:Panel ID="pnlTextBoxEntrada" Width="70%" runat="server" Visible="true" class="form-group">
                            <asp:TextBox class="form-control" ID="txtEntrada" name="Entrada" placeholder="Seleccione parámetro para la búsqueda" ClientIDMode="Static" runat="server" ToolTip="Seleccione un parametro para la búsqueda." disabled="disabled"></asp:TextBox>
                        </asp:Panel>
                    </div>

                    <div class="col-md-3">

                        <button type="button" id="btnBuscar" runat="server" class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="collapse" data-target="#divResultados" onserverclick="BtnBuscar_ServerClick">
                            <span class="glyphicon glyphicon-search"></span>&nbsp;Buscar</button>

                        <button type="button" id="btnLimpiarParametros" runat="server" class="btn btn-default" onserverclick="BtnLimpiarParam_ServerClick">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;Limpiar
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--FIN PARAMETROS BUSQUEDA --->
    <!--RESULTADOS BUSQUEDA DE BENEFICIOS--->

    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanelTab1">
        <ContentTemplate>--%>


    <div id="divResultados" runat="server" style="display: none">
        <div id="divPrimarioBenef" runat="server" class="panel panel-primary">
            <div id="divResulBusq" class="panel-heading" runat="server">
                <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion">Resultados de la búsqueda:</h4>
            </div>
            <div id="divCollapseBeneficios" runat="server" class="panel-body panel-collapse collapse in col-md-13">
                <div class="panel-body">
                    <div class="col-md-12">
                        <asp:GridView ID="gv_Beneficios" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_Beneficios_RowCommand" OnSelectedIndexChanged="gv_Beneficios_SelectedIndexChanged" DataKeyNames="beneficio" CssClass="table table-striped table-bordered table-condensed">
                            <%--<asp:GridView ID="gv_Beneficios" UseAccessibleHeader="true" runat="server" AllowPaging="True" PageSize="5" PagerSettings-Mode="NumericFirstLast" AutoGenerateColumns="False"
                            OnRowCommand="gv_Beneficios_RowCommand" OnPageIndexChanging="gv_Beneficios_PageIndexChanging" OnSelectedIndexChanged="gv_Beneficios_SelectedIndexChanged" DataKeyNames="beneficio" CssClass="table table-striped table-bordered table-condensed">--%>
                            <Columns>

                                <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-info" ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                    ButtonType="Button" Text="Detalle">
                                    <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                </asp:ButtonField>
                                <asp:BoundField DataField="cuil" HeaderText="CUIL" SortExpression="cuil" />
                                <asp:BoundField DataField="beneficio" DataFormatString="{0:D11}" HeaderText="Nro. Beneficio" SortExpression="beneficio" />
                                <asp:BoundField DataField="apellidoyNombre" HeaderText="Apellido y Nombre" SortExpression="Ap y Nombre" />
                                <asp:BoundField DataField="mBaja" HeaderText="Marca Baja" SortExpression="M.Baja" />
                                <asp:BoundField DataField="mLiquidado" HeaderText="Marca Liquidado" SortExpression="M.Liquidado" />
                                <asp:BoundField DataField="tipoDoc" HeaderText="Tipo Doc." SortExpression="T.Doc" />
                                <asp:BoundField DataField="nroDoc" HeaderText="Nro. Doc." SortExpression="N. Doc" />

                            </Columns>
                            <%--<PagerSettings Mode="NumericFirstLast"></PagerSettings>--%>
                        </asp:GridView>
                        <asp:Repeater ID="rptPager" runat="server">
                            <ItemTemplate>
                                <asp:Button ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>' Enabled='<%# Eval("Enabled") %>' OnClick="Page_Changed"></asp:Button>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="loading">
                            <asp:Label runat="server" BorderColor="SkyBlue" BorderStyle="Solid" BackColor="LightGray">Por favor espere... <img src="../imagenes/loading.gif" alt="" /></asp:Label>

                        </div>
                    </div>
                    <div class="col-xs-13 col-xs-offset-8">
                        <button type="button" id="btnLimpiarResultado" runat="server" class="btn btn-default" onserverclick="BtnLimpiarResult_ServerClick">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;limpiar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--FIN RESULTADOS BUSQUEDA DE BENEFICIOS--->
    <!--ACORD-->
    <div id="divDatosPersona" runat="server" style="display: none">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4>Datos de la Persona:</h4>
            </div>

            <%-- <div runat="server">
                    <a href="#" class="btn btn-default openall">open all</a> <a href="#" class="btn btn-default closeall">close all</a>
            </div>--%>

            <div class="panel-body">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-info">
                        <!--DATOS PERSONA-->
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1">Datos Persona</a>
                            </h3>

                        </div>

                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel panel-info">
                                <table class="table table-striped">
                                    <tr>
                                        <th scope="row">CUIL:</th>
                                        <td>
                                            <asp:Label ID="lblCuil" runat="server"></asp:Label></td>
                                        <th scope="row">Beneficio:</th>
                                        <td>
                                            <asp:Label ID="lblBeneficio" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Apellido y Nombre:</th>
                                        <td>
                                            <asp:Label ID="lblApNom" runat="server"></asp:Label></td>
                                        <th scope="row">Tipo y Nro.Doc.:</th>
                                        <td>
                                            <asp:Label ID="lblTyNroDoc" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Sexo:</th>
                                        <td>
                                            <asp:Label ID="lblSexo" runat="server"></asp:Label></td>
                                        <th scope="row">Fecha Nacim.:</th>
                                        <td>
                                            <asp:Label ID="lblFNac" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Nacionalidad:</th>
                                        <td>
                                            <asp:Label ID="lblNacion" runat="server"></asp:Label></td>
                                        <th scope="row">Est.Civil:</th>
                                        <td>
                                            <asp:Label ID="lblEstCiv" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--FIN DATOS PERSONA-->
                    <!--DATOS BENEFICIO-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse2">Datos Beneficio</a>
                            </h3>

                        </div>

                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel panel-info">
                                <table class="table table-striped">
                                    <tr>
                                        <th scope="row">Fecha de Alta:</th>
                                        <td>
                                            <asp:Label ID="lblFAlta" runat="server"></asp:Label></td>
                                        <th scope="row">Cuil Causante:</th>
                                        <td>
                                            <asp:Label ID="lblCuilCausante" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Régimen Jubilatorio:</th>
                                        <td>
                                            <asp:Label ID="lblRegJub" runat="server"></asp:Label></td>
                                        <th scope="row">Banco Agencia:</th>
                                        <td>
                                            <asp:Label ID="lblBcoAgen" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Clase de Beneficio:</th>
                                        <td>
                                            <asp:Label ID="lblClaseBenef" runat="server"></asp:Label></td>
                                        <th scope="row">Exp.Iniciado:</th>
                                        <td>
                                            <asp:Label ID="lblExpIniciado" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ley Aplicada:</th>
                                        <td>
                                            <asp:Label ID="lblLeyAplic" runat="server"></asp:Label></td>
                                        <th scope="row">Haber Real:</th>
                                        <td>
                                            <asp:Label ID="lblHaberReal" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Haber Real Recuperado:</th>
                                        <td>
                                            <asp:Label ID="lblHabRealRec" runat="server"></asp:Label></td>
                                        <th scope="row">Fecha:</th>
                                        <td>
                                            <asp:Label ID="lblFechaHabRealRec" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Porc. del Benef.:</th>
                                        <td>
                                            <asp:Label ID="lblPorcBenef" runat="server"></asp:Label></td>
                                        <th scope="row">Porc. de Cómputo:</th>
                                        <td>
                                            <asp:Label ID="lblPorcComp" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Fecha Inicial Pago:</th>
                                        <td>
                                            <asp:Label ID="lblFInicialPag" runat="server"></asp:Label></td>
                                        <th scope="row">Causa de Vencim.:</th>
                                        <td>
                                            <asp:Label ID="lblCausaVenc" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Marca Tope:</th>
                                        <td>
                                            <asp:Label ID="lblMarcTope" runat="server"></asp:Label></td>
                                        <th scope="row">Liq. Especiales:</th>
                                        <td>
                                            <asp:Label ID="lblLiqEsp" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Codigo Pago:</th>
                                        <td>
                                            <asp:Label ID="lblCodPago" runat="server"></asp:Label></td>
                                        <th scope="row">Beneficio Multiple:</th>
                                        <td>
                                            <asp:Label ID="lblBenefMult" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Caja Otorgante:</th>
                                        <td>
                                            <asp:Label ID="lblCajaOt" runat="server"></asp:Label></td>
                                        <th scope="row">Condición Especial:</th>
                                        <td>
                                            <asp:Label ID="lblCondEsp" runat="server"></asp:Label></td>
                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>
                    <!--FIN DATOS BENEFICIO-->
                    <!--DATOS ADICIONALES-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse3">Datos Adicionales</a>
                            </h3>
                        </div>

                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel panel-info">
                                <table class="table table-striped">
                                    <tr>
                                        <th scope="row">Marca Luz y Fuerza:</th>
                                        <td>
                                            <asp:Label ID="lblMarcaLuzFza" runat="server"></asp:Label></td>
                                        <th scope="row">Marca de Retiro:</th>
                                        <td>
                                            <asp:Label ID="lblMarcaRetiro" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Tipo de Docente:</th>
                                        <td>
                                            <asp:Label ID="lblTipoDocente" runat="server"></asp:Label></td>
                                        <th scope="row">Benef C/Igual documento :</th>
                                        <td>
                                            <asp:Label ID="lblBenefIgualDoc" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">F.Aumento Ley Común:</th>
                                        <td>
                                            <asp:Label ID="lblFAumLeyComun" runat="server"></asp:Label></td>
                                        <th scope="row">F.Aumento Ley Espec.:</th>
                                        <td>
                                            <asp:Label ID="lblFAumLeyEsp" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Suma de Haberes:</th>
                                        <td>
                                            <asp:Label ID="lblSumaHaber" runat="server"></asp:Label></td>
                                        <th scope="row">Haber Máximo (Sin 204) :</th>
                                        <td>
                                            <asp:Label ID="lblHaberMax" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Pres.Embargo Ctas.ANSES :</th>
                                        <td>
                                            <asp:Label ID="lblPresEmbCtasAns" runat="server"></asp:Label></td>
                                        <th scope="row">F.Aprop.Cuil :</th>
                                        <td>
                                            <asp:Label ID="lblFApropCuil" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Condic.de Alta:</th>
                                        <td>
                                            <asp:Label ID="lblCondicAlta" runat="server"></asp:Label></td>
                                        <th scope="row">Marca Dec.2196:</th>
                                        <td>
                                            <asp:Label ID="lblMarcaDec2196" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">AFJP/CSR:</th>
                                        <td>
                                            <asp:Label ID="lblAfjp" runat="server"></asp:Label></td>
                                        <th scope="row">Modalidad de Pago:</th>
                                        <td>
                                            <asp:Label ID="lblModalPago" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </div>
                    <!--FIN DATOS ADICIONALES-->
                    <!--DATOS CONCEPTOS-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <a class="accordion-toggle" id="aco2" data-toggle="collapse" data-parent="#accordion" href="#collapse4">Datos Conceptos</a>
                            </h3>
                        </div>

                        <div id="collapse4" class="panel-collapse collapse">
                            <%--<asp:Button ID='lnkConcepto' class='btn btn-primary' runat='server' Text ='Detalle' CommandArgument='25' Enabled='true' OnClick='CargaDetalleConceptos'></asp:Button>
                            <asp:Literal ID="DynamicTable" runat="server"></asp:Literal>--%>

                            <asp:GridView ID="gv_Conceptos" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_Conceptos_RowCommand"
                                OnSelectedIndexChanged="gv_Conceptos_SelectedIndexChanged" DataKeyNames="beneficio" OnRowCreated="gv_Conceptos_RowCreated"
                                CssClass="table table-striped table-bordered table-condensed">
                                <Columns>
                                    <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-info" ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                        ButtonType="Button" Text="Detalle">
                                        <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                    </asp:ButtonField>
                                    <%--<asp:BoundField DataField="Beneficio" HeaderText="Beneficio" SortExpression="Beneficio" />
                                    <asp:BoundField DataField="ImporteNeto" HeaderText="ImporteNeto" SortExpression="ImporteNeto" />--%>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                    <!--FIN DATOS CONCEPTOS-->
                    <!--BOTONERA-->
                    <b>&nbsp;</b>
                    <div class="col-xs-13 col-xs-offset-7">
                        <%--<button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalConceptos">
                            <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Conceptos
                        </button>--%>
                        <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalDomicilio">
                            <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Domicilio
                        </button>
                        <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalApoderado">
                            <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Apoderado
                        </button>
                        <button type="button" id="btnLimpiarDatosPersona" runat="server" class="btn btn-default" onserverclick="BtnLimpiarDatPers_ServerClick">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;limpiar
                        </button>
                    </div>
                    <!--FIN BOTONERA-->
                </div>
            </div>
            <!--FIN ACORD-->
        </div>
    </div>




    <!-- MODALES -->
    <!-- MODAL CONCEPTOS -->
    <%--<div id="modalConceptos" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Conceptos</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>--%>
    <!-- FIN MODAL CONCEPTOS -->

    <!-- MODAL DOMICILIO -->
    <div id="modalDomicilio" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Domicilio</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <!-- FIN MODAL DOMICILIO -->

    <!-- MODAL APODERADO -->
    <div id="modalApoderado" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Apoderado</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <!-- FIN MODAL APODERADO -->

    <div id="ModalConceptos" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <!-- Modal content-->
                            <div>
                                <asp:DataGrid ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-condensed" Width="100%">
                                    <Columns>
                                        <%--<asp:BoundColumn DataField="concepto" HeaderText="concepto"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="empresa" HeaderText="empresa"></asp:BoundColumn>--%>
                                        
                                    </Columns>
                                </asp:DataGrid>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

    <%--        </ContentTemplate>
    </asp:UpdatePanel>




    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanelTab1">
        <ProgressTemplate>
            <div class="overlay" />
            <div class="overlayContent" style="margin-top: 300px">
                <img alt="loading" src="../imagenes/loading.gif" width="80" height="80" />
                <div>
                    <asp:Label runat="server" ID="lblmsjEspere3" CssClass="mensajeEspera">Por favor espere...</asp:Label>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>




    <!--FUNCION TAB PARA CAMPOS TXT-->
    <script type="text/javascript">
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
    </script>

    <!--FUNCION collapse div resultados-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".btnBuscar").on('click', function () {
                $("#divResultados").collapse('show');
            });
        });
    </script>



    <!--FUNCION Modal Wait-->
    <script src="../Scripts/spin.min.js"></script>
    <script src="../Scripts/ladda.min.js"></script>

    <!--FUNCION BOTON-->
    <script>

        // Bind normal buttons
        Ladda.bind('button', { timeout: 50000 });

        // Bind progress buttons and simulate loading progress
        Ladda.bind('button', {
            callback: function (instance) {
                var progress = 0;
                var interval = setInterval(function () {
                    progress = Math.min(progress + Math.random() * 0.1, 1);
                    instance.setProgress(progress);

                    if (progress === 1) {
                        instance.stop();
                        clearInterval(interval);
                    }
                }, 400);
            }
        });

        // You can control loading explicitly using the JavaScript API
        // as outlined below:

        // var l = Ladda.create( document.querySelector( 'button' ) );
        // l.start();
        // l.stop();
        // l.toggle();
        // l.isLoading();
        // l.setProgress( 0-1 );

    </script>
    <!--FUNCION BOTON-->
    <script>
        $('.btnBuscar').click(function () {
            $('.panel-collapse.in')
                .collapse('show');
        });

    </script>

    <%--    <script>

        // Bind normal buttons
        Ladda.bind('LinkButton', { timeout: 50000 });

        // Bind progress buttons and simulate loading progress
        Ladda.bind('button', {
            callback: function (instance) {
                var progress = 0;
                var interval = setInterval(function () {
                    progress = Math.min(progress + Math.random() * 0.1, 1);
                    instance.setProgress(progress);

                    if (progress === 1) {
                        instance.stop();
                        clearInterval(interval);
                    }
                }, 200);
            }
        });

        // You can control loading explicitly using the JavaScript API
        // as outlined below:

        // var l = Ladda.create( document.querySelector( 'button' ) );
        // l.start();
        // l.stop();
        // l.toggle();
        // l.isLoading();
        // l.setProgress( 0-1 );

    </script>--%>



    <%--<style>
        .overlay {
            position: fixed;
            z-index: 98;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            background-color: #aaa;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

        .overlayContent {
            z-index: 99;
            margin: 250px auto;
            width: 100px;
            height: 200px;
        }

            .overlayContent h2 {
                font-size: 18px;
                font-weight: bold;
                color: #000;
            }

            .overlayContent img {
                width: 40px;
                height: 40px;
            }
    </style>--%>

    <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: gray;
            z-index: 9999;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            background-color: gray;
            font-family: Arial;
            font-size: 15pt;
            width: 220px;
            height: 35px;
            display: none;
            position: fixed;
            z-index: 999;
        }
    </style>

    <script type="text/javascript" src="../scripts/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 100);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>

</asp:Content>





