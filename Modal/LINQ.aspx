<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="LINQ.aspx.cs" Inherits="Modal.LINQ" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/alasql.min.js"></script>
    <script src="js/xlsx.core.min.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="container">
    </div>
    <script type="text/javascript">

        var person = [
            { name: 'bill', sex: 'M', income: 50000 },
            { name: 'sara', sex: 'F', income: 100000 },
            { name: 'larry', sex: 'M', income: 90000 },
            { name: 'olga', sex: 'F', income: 85000 },
        ];
        //var datos = document.getElementById("etidato")
        //// Do the query
        //console.log(datos);
        //var res = alasql("SELECT * FROM ? ", [person];
        //console.log(res);

        //var person = "";
        //var person = document.getElementById('etijson');
        <%--function carga() {
            person = <%= Losdatos10() %>
            
        };--%>


        function lafun() {

            var res1 = alasql("SELECT * FROM ? where sex = 'M' ", [person]);
            document.getElementById('ellabal').innerHTML = res1[0].name;
            console.log(res1);
        };

        function lafun2() {
            var periodo = 'periodo';
            var res1 = alasql("SELECT sum(importe) as a FROM ? where periodo = '201910'", [person]);
            document.getElementById('ellabal').innerHTML = res1[0].a;
            console.log(res1);
        };
    </script>
    <input value="Cargar" onclick="carga()" type="button">
    <%--<input value="Cargar" runat="server" onclick="carga()" type="button">    --%>
    <input value="La funcion" onclick="lafun()" type="button">
    <input value="La funcion2" onclick="lafun2()" type="button">
    <asp:Label runat="server" ID="ellabal">sfasdfasdf</asp:Label>
    <%--<asp:Button Text="Boton ASP" runat="server" OnClick="ObtenerDatos"></asp:Button>--%>
    <form id="form2" runat="server">
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
                        <div id="divCollapseBeneficios" runat="server" class="panel-body panel-collapse collapse in col-md-13">
                            <div class="panel-body">
                                <%--<form id="form1" runat="server">--%>
                                <div class="col-md-12">
                                    
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
                                    
                                    <asp:GridView ID="gv_Beneficios" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_Beneficios_RowCommand" OnSelectedIndexChanged="gv_Beneficios_SelectedIndexChanged" DataKeyNames="beneficio" CssClass="table table-striped table-bordered table-condensed">
                                        <Columns>

                                            <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-info" ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                                ButtonType="Button" Text="Detalle">
                                                <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                            </asp:ButtonField>
                                            <asp:BoundField DataField="beneficio" HeaderText="beneficio" SortExpression="beneficio" />
                                            <asp:BoundField DataField="importe" HeaderText="importe" SortExpression="importe" />
                                           
                                        </Columns>
                                       
                                    </asp:GridView>
                                        
                                    
                                    <br />
                                        
                                    
                                </div>

                                <div class="col-md-12">
                                    
                                    <asp:GridView ID="GridView1" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_Beneficios_RowCommand" OnSelectedIndexChanged="gv_Beneficios_SelectedIndexChanged" DataKeyNames="beneficio" CssClass="table table-striped table-bordered table-condensed">
                                        <Columns>

                                            <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-info" ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                                ButtonType="Button" Text="Detalle">
                                                <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                            </asp:ButtonField>
                                            <asp:BoundField DataField="beneficio" HeaderText="beneficio" SortExpression="beneficio" />
                                            <asp:BoundField DataField="importe" HeaderText="importe" SortExpression="importe" />
                                           
                                        </Columns>
                                       
                                    </asp:GridView>
                                        
                                    
                                </div>
                                <%--</form>--%>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse2">Datos Beneficio</a>
                    </h3>

                </div>

                <div id="collapse2" class="panel-collapse collapse">
                    <div class="panel panel-info">
                        <%string a = "1";
                            for (int i = 0; i < 5; i++)
                            {%>
                        <table class="table table-striped" id="Tabla<%i.ToString(); %>">
                            <tr>
                                <th scope="row">Fecha de Alta:</th>
                                <td>
                                    <asp:Label ID="lblFAlta" runat="server"></asp:Label></td>
                                <th scope="row">Cuil Causante:</th>
                                <td>
                                    <asp:Label ID="lblCuilCausante" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <th scope="row">Caja Otorgante:</th>
                                <td>
                                    <asp:Label ID="lblCajaOt" runat="server"></asp:Label></td>
                                <th scope="row">Condición Especial:</th>
                                <td>
                                    <asp:Label ID="lblCondEsp" runat="server"></asp:Label></td>
                                <td>
                                    <%--<%var detmod = "#modalDetalle" + i.ToString();%>--%>
                                    <button type="button" class="ladda-button btn btn-primary" data-toggle="modal" data-target="#modalDetalle0">
                                        <span class="glyphicon glyphicon-eye-open"></span>
                                        &nbsp; &nbsp;Apoderado</button>
                                </td>
                            </tr>
                        </table>


                        <%}; %>
                    </div>
                </div>
            </div>
            
             <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse20">Datos Beneficio</a>
                    </h3>

                </div>

                <div id="collapse20" class="panel-collapse collapse">
                    <div class="panel panel-info">
                        <asp:Literal ID="DynamicTable" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
            <b>&nbsp;</b>
            <div class="col-xs-13 col-xs-offset-7">
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal">
                    <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Consulta LINQ
                </button>
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#<%= Respuesta()%>">
                    <span class="glyphicon glyphicon-ok"></span>&nbsp; &nbsp;Domicilio
                </button>
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalApoderado0">
                    <span class="glyphicon glyphicon-asterisk"></span>&nbsp; &nbsp;Apoderado
                </button>
                <asp:Label ID="laetiqueta" runat="server"></asp:Label>
            </div>
                 
        </div>
    </div>
    </form >
    <script type="text/javascript">
        $(document).ready(function () {
            $(".btnBuscar").on('click', function () {
                $("#divResultados").collapse('show');
            });
        });
    </script>

    <!-- Modal -->
    <!-- MODAL APODERADO -->
    <div id="modalDetalle0" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Apoderado</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible. 0</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <div id="modalDetalle1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Apoderado</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible. 1</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <div id="modalDetalle2" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Apoderado</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible. 2</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <div id="modalDetalle3" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Apoderado</h4>
                </div>
                <div class="modal-body">
                    <p>Módulo en desarrollo. Aun no está disponible. 3</p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <!-- FIN MODAL APODERADO -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
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

</body>
</html>
