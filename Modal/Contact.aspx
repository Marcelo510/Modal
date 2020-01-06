<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Modal.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bienes Raices</title>
        <link rel="stylesheet" href="styles/styles.css">
    </head>
    <body>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
          Launch demo modal
        </button>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" RenderMode="Block">
            <ContentTemplate>
                <asp:Label ID="prime" Text="" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="UpdatePanel2" RenderMode="Block">
            <ContentTemplate>
                <asp:TextBox runat="server" id="TextBox1" OnTextChanged="TextBox1_TextChanged" AutopostBack="true" >  </asp:TextBox>
                <asp:Label ID="LabelTextbox1" Text="" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </body>
</html>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <asp:TextBox runat="server" id="Texto" >  </asp:TextBox>
          
          <label id="eldato"></label>
          <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Confirmar" />
          <asp:UpdatePanel runat="server" ID="upAlgo" RenderMode="Block">
              <ContentTemplate>
                  <div id="elresultado" runat="server" visible="true">
                      
                      <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Confirmar" />
                  </div>
                  <div id="segundo" runat="server" visible="false">
                      <asp:Label ID="eldat" Text="text" runat="server" />
                  </div>
              </ContentTemplate>
          </asp:UpdatePanel>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirmar" />
        </p>
      </div>
    </div>
  </div>
</div> 


<div class="container">
</div>
</asp:Content>