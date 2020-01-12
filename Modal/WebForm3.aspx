<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Modal.WebForm3" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
    </div>

    <div class="panel-body">
        <div class="panel-group" id="accordion">
            
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
                                <button type="button" class="ladda-button btn btn-primary" data-toggle="modal"  data-target="#modalDetalle0">
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
                <!--DATOS PERSONA-->
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <a class="accordion-toggle" id="aco2" data-toggle="collapse" data-parent="#accordion" href="#collapse1">Datos Persona</a>
                    </h3>
                    
                </div>

                <div id="collapse1" class="panel-collapse collapse" >
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#aco2" href="#collapse10">Datos 2</a>
                    <table class="table">
                              <tbody>
                                <tr>
                                  <td>Mark</td>
                                  <td>Otto</td>
                                  <td>mdo</td>
                                </tr>
                                <tr>
                                  <td>Jacob</td>
                                  <td>Thornton</td>
                                  <td>@fat</td>
                                </tr>
                                <tr>
                                  <td>Larry</td>
                                  <td>the Bird</td>
                                  <td>twitter</td>
                                </tr>
                              </tbody>
                            </table>
                    <div id="collapse10" class="panel-collapse collapse">
                        
                            <table class="table">
                              <tbody>
                                <tr>
                                  <td>Mark</td>
                                  <td>Otto</td>
                                  <td>mdo</td>
                                </tr>
                                <tr>
                                  <td>Jacob</td>
                                  <td>Thornton</td>
                                  <td>@fat</td>
                                </tr>
                                <tr>
                                  <td>Larry</td>
                                  <td>the Bird</td>
                                  <td>twitter</td>
                                </tr>
                              </tbody>
                            </table>
                       
                    </div>
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#aco2" href="#collapse11">Datos 2</a>
                    <table class="table">
                              <tbody>
                                <tr>
                                  <td>Mark</td>
                                  <td>Otto</td>
                                  <td>mdo</td>
                                </tr>
                                <tr>
                                  <td>Jacob</td>
                                  <td>Thornton</td>
                                  <td>@fat</td>
                                </tr>
                                <tr>
                                  <td>Larry</td>
                                  <td>the Bird</td>
                                  <td>twitter</td>
                                </tr>
                              </tbody>
                            </table>
                    <div id="collapse11" class="panel-collapse collapse">
                        
                            <table class="table">
                              <tbody>
                                <tr>
                                  <td>Mark</td>
                                  <td>Otto</td>
                                  <td>mdo</td>
                                </tr>
                                <tr>
                                  <td>Jacob</td>
                                  <td>Thornton</td>
                                  <td>@fat</td>
                                </tr>
                                <tr>
                                  <td>Larry</td>
                                  <td>the Bird</td>
                                  <td>twitter</td>
                                </tr>
                              </tbody>
                            </table>
                       
                    </div>
                </div>


            </div>
            <b>&nbsp;</b>
            <div class="col-xs-13 col-xs-offset-7">
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalConceptos0">
                    <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Conceptos
                </button>
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalDomicilio0">
                    <span class="glyphicon glyphicon-ok"></span>&nbsp; &nbsp;Domicilio
                </button>
                <button class="ladda-button btn btn-primary" data-style="zoom-out" data-toggle="modal" data-target="#modalApoderado0">
                    <span class="glyphicon glyphicon-asterisk"></span>&nbsp; &nbsp;Apoderado
                </button>

            </div>
        </div>
    </div>

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
