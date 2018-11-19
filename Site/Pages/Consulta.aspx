<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Consulta.aspx.cs" Inherits="Site.Pages.Consulta" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            <div class="span10 offset1">
                <div class="row">
                    <h3 class="well" style="text-align:center">Consultar Tarefas</h3>
                    
                    <strong>Filtrar por:</strong>&nbsp;&nbsp; 
                    <strong>Data Inicial:</strong>&nbsp; <asp:TextBox ID="txtDataInicial" runat="server" Width="10%" placeholder="DD/MM/AAAA" MaxLength="10"></asp:TextBox>&nbsp;&nbsp; 
                    <asp:RequiredFieldValidator ID="RequiredDataInicial" runat="server" 
                        ControlToValidate="txtDataInicial" ErrorMessage="Campo data inicial é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>
                    <strong>Data Final:</strong>&nbsp; <asp:TextBox ID="txtDataFinal" runat="server" Width="10%" placeholder="DD/MM/AAAA" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredDataFinal" runat="server" 
                        ControlToValidate="txtDataFinal" ErrorMessage="Campo data final é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnConsultar" runat="server" Text="Consultar" CssClass="btn btn-primary btn-sm" OnClick="btnConsultar_Click" />
                    
                    
                    <br />
                    <br />

                    

                    <asp:GridView ID="gridTarefas" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" GridLines="None"  BackColor="#D8E4E4">
                         <Columns>
                             <asp:BoundField SortExpression="Codigo" DataField="Codigo" HeaderText="Codigo" />
                             <asp:BoundField SortExpression="Nome" DataField="Nome" HeaderText="Nome" />
                             <asp:BoundField SortExpression="Tipo" DataField="Tipo" HeaderText="Tipo" />
                             <asp:BoundField SortExpression="Responsavel" DataField="Responsavel" HeaderText="Responsavel" />
                             <asp:BoundField SortExpression="DataEntrega" DataField="DataEntrega" HeaderText="Data da entrega" />
                         </Columns>
                         <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                    <p>
                        <asp:Label ID="lblMensagem" runat="server" ForeColor="Red"></asp:Label>
                    </p>
                </div>
            </div>
        </div>
</asp:Content>

