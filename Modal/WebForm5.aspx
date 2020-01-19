<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="Modal.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
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
                                    <asp:GridView ID="gv_Beneficios" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="true" 
                                        OnRowCommand="gv_Beneficios_RowCommand" 
                                        OnSelectedIndexChanged="gv_Beneficios_SelectedIndexChanged" DataKeyNames="beneficio" 
                                        CssClass="table table-striped table-bordered table-condensed">
                                        <Columns>

                                            <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-primary" 
                                                 ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                                ButtonType="Button" Text="Detalle">
                                                <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                            </asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <button runat="server" data-target="#modalDetalle0" value="detalle"></button>

     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDetalle0">
          Launch demo modal
        </button>
    </div>
   
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
                    <div class="col-md-12">
                                    <asp:GridView ID="GridView1" UseAccessibleHeader="true" runat="server" AutoGenerateColumns="true" 
                                         
                                        CssClass="table table-striped table-bordered table-condensed">
                                        <Columns>

                                            <asp:ButtonField CommandName="Select" ControlStyle-CssClass="btn btn-primary" 
                                                 ImageUrl="~/imagenes/glyphicon glyphicon-eye-open.png"
                                                ButtonType="Button" Text="Detalle">
                                                <ControlStyle CssClass="btn btn-default btn-xs"></ControlStyle>
                                            </asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>


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
    
    <%--<script type="text/javascript" src="~/scripts/jquery.min.js"></script>--%>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
    <script type="text/javascript">

        function showModalExito() {
            $("#modalDetalle0").modal("show");
        }


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
