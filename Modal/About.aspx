<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Modal.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bienes Raices</title>
        <link rel="stylesheet" href="styles/styles.css">

        <script type="text/javascript">
          //during onload we set the onclick method of our button
          //to call MyMethod from the server
          window.onload = function(){
            document.getElementById('Button2').onclick = function() {
                PageMethods.ejecutar();
            }
          }

          //function myMethodCallBackSuccess(response) {
          //    //JavaScript code that will run
          //    //after MyMethod was run successfully on server
          //    //respose is the returned value of MyMethod
          //    alert(response);
          //}

          //function myMethodCallBackFailed(error) {
          //    alert(error.get_message());
          //}
        </script>
    </head>
    <body>
        <button type="button" runat="server"  class="btn btn-primary" data-toggle="modal" OnClientClick="Button1_Click" OnClick ="Button1_Click" data-target="Button1_Click">
          Launch demo modal
        </button>
        <button type="button" class="ladda-button btn btn-primary"  data-toggle="modal" onclick ="Boton_Modal" data-target="#modalApoderado">
            <span class="glyphicon glyphicon-eye-open"></span>&nbsp; &nbsp;Apoderado
        </button>
        <%--<asp:ScriptManager runat="server" EnablePageMethods="true" />--%>
          <asp:Button runat="server" ID="Button2" ClientIDMode="Static" Text="Call MyMethod" UseSubmitBehavior="false" />
        
    </body>

</html>


<!-- Modal -->
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
                    <asp:TextBox runat="server" id="TextoModal" >  </asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>
    <!-- FIN MODAL APODERADO -->



    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />



<div class="container">
</div>
</asp:Content>