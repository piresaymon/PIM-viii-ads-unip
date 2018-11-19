<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Default.aspx.cs" Inherits="Site.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        .centercolumn {
            margin: 0 auto;
            width: 80%;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />

    <div class="centercolumn">
        <strong>Tarefas que expiram hoje ou já expiraram</strong>: 
        <asp:Label ID="lblMensagem" runat="server" Visible="false"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gridDatas" runat="server" CssClass="table table-hover table-striped" GridLines="None" AutoGenerateColumns="False" BackColor="#D8E4E4">
            <Columns>
            <asp:BoundField DataField="Nome" HeaderText="Nome da tarefa" />
            <asp:BoundField DataField="DataEntrega" HeaderText="Data de expiração" />
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>
</asp:Content>





