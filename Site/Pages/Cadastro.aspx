<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Cadastro.aspx.cs" Inherits="Site.Pages.Cadastro" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="container">
            <div class="span10 offset1">
                <div class="row">
                    <h3 class="well" style="text-align:center">Cadastrar Tarefas</h3>
                    <br />
                    <div>
                        Nome<br />
                    <asp:TextBox ID="txtNome" runat="server" placeholder="Digite o nome da tarefa" Width="50%" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNome" runat="server" 
                        ControlToValidate="txtNome" ErrorMessage="Campo nome é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>

                    <br /><br />
                        Tipo<br />
                    <asp:DropDownList ID="ddltipo" runat="server"  AutoPostBack="true" CssClass="form-control" Width="50%" >
                        <asp:ListItem Value="0" Text="Trabalho"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Prova"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Atividade complementar"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Dependência"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Etc"></asp:ListItem>
                    </asp:DropDownList>

                    <br /><br />
                        Responsável<br />
                    <asp:TextBox ID="txtResponsavel" runat="server" placeholder="Digite o responsável pela tarefa" Width="50%" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredResponsavel" runat="server" 
                        ControlToValidate="txtResponsavel" ErrorMessage="Campo responsável é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br /><br />
                    
                        Data da entrega<br />
                    <asp:TextBox ID="txtDataEntrega" runat="server" Width="10%" placeholder="DD/MM/AAAA" MaxLength="10" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredDataEntrega" runat="server" 
                        ErrorMessage="Campo data da entrega é obrigatório." Display="Dynamic" ForeColor="Red" ControlToValidate="txtDataEntrega"></asp:RequiredFieldValidator>
                    


                    <br /><br />

                    <p>
                        <asp:Label ID="lblMensagem" runat="server" ForeColor="Red"></asp:Label>
                    </p>
                    <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" CssClass="btn btn-success" OnClick="btnCadastrarCliente" Width="100px" />
                    </div>
                </div>
            </div>
        </div>


</asp:Content>


