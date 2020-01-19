<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Modal.WebForm4" %>


<asp:Content runat="server" ContentPlaceHolderID="Contenedor">
    <button type="button" id="btnLimpiarParametros" runat="server" class="btn btn-default" onserverclick="BtnLimpiarParam_ServerClick">
        &nbsp;Limpiar
    </button>

    <!-- MODALES -->
    <!-- MODAL CONCEPTOS -->
    <div id="myModalPeriodo" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Conceptos</h4>
                </div>

                <div runat="server" class="modal-body">
                    <table class="table table-striped">
                        <tr>
                            <th scope="row">Mes:</th>
                            <td>
                                <input type="text" id="txtmes" runat="server" name="inMes" placeholder="Mes" class="form-control" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">Año:</th>
                            <td>
                                <input type="text" name="inAno" placeholder="Año" autocomplete="off" class="form-control placeholder-no-fix" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td>
                                <button type="submit" runat="server" class="btn btn-default" value="Enviar" onserverclick="BtnPeriodo_ServerClick" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
            
        </div>
    </div>
    <!-- FIN MODAL CONCEPTOS -->

    <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: transparent;
            z-index: 9999;
            min-height: 100%;
            width: 100%;
        }
    </style>


    

    



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
                }, 600);
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
    <script>
        if (typeof (abrirModal) != "undefined") $('#myModalPeriodo').modal('show');
    </script>
</asp:Content>

