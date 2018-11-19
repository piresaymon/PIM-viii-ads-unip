<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Detalhes.aspx.cs" Inherits="Site.Pages.Detalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="Content/bootstrap.css" />
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <script src="bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.12.4.min.js"></script>  
    <script src="Scripts/jquery-ui.js"></script>
    <script>  
        $(function ()  
        {  
            $('#ContentPlaceHolder1_txtDataEntrega').datepicker(  
            {  
                dateFormat: 'dd/mm/yy',  
                changeMonth: true,  
                changeYear: true,  
                yearRange: '1950:2100',
                dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
                monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
                nextText: 'Próximo',
                prevText: 'Anterior'
            });  
        })  
    </script> 
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
            <div class="span10 offset1">
                <div class="row">
                    <h3 class="well" style="text-align:center">Alterar/Excluir Tarefa</h3>
                    <br />
                    
                    <div class="col-sm-4" style="background-color:lavender;">
                        <br />
                        Informe o código da tarefa:&nbsp;
                        <asp:TextBox ID="txtCodigo" runat="server" Width="20%"></asp:TextBox>&nbsp;&nbsp;
                        <asp:Button ID="btnPesquisa" runat="server" Text="Pesquisar" CssClass="btn btn-info" OnClick="btnPesquisarCliente" Width="100px"/>
                        <br />
                        <br />
                        <p>
                            <asp:Label ID="lblMensagem" runat="server" ForeColor="Red"></asp:Label>
                        </p>
                    </div>

                    <div class="col-sm-8" style="background-color:lavender;">
                        <asp:Panel ID="panelDados" runat="server">
                            Nome da tarefa:<br />
                            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" Width="50%" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredNome" runat="server" 
                                ControlToValidate="txtNome" ErrorMessage="Campo Nome da tarefa é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>

                            <br /><br />
                            Tipo de tarefa: <br />
                            <asp:DropDownList ID="ddltipo" runat="server" CssClass="form-control" Width="50%" >
                                <asp:ListItem Value="0" Text="Atividade Complementar"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Dependência"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Prova"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Trabalho"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Outras Atividades"></asp:ListItem>
                            </asp:DropDownList>

                            <br /><br />
                            Responsável:<br />
                            <asp:TextBox ID="txtResponsavel" runat="server" CssClass="form-control" Width="50%" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredResponsavel" runat="server" 
                                ControlToValidate="txtResponsavel" ErrorMessage="Campo Responsável é obrigatório." ForeColor="Red"></asp:RequiredFieldValidator>
                            <br /><br />

                            Data da entrega: <br />
                            <asp:TextBox ID="txtDataEntrega" runat="server" Width="25%" placeholder="DD/MM/AAAA" onkeyup="formataData(this,event);" MaxLength="10" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredDataEntrega" runat="server" 
                                ErrorMessage="Campo Data da entrega é obrigatório." Display="Dynamic" ForeColor="Red" ControlToValidate="txtDataEntrega"></asp:RequiredFieldValidator>
                            <br /><br />
                        
                            <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CssClass="btn btn-danger btn-lg" OnClick="btnExcluirCliente" Width="109px" />
                            <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" CssClass="btn btn-primary btn-lg" OnClick="btnAtualizarCliente" Width="116px" />
                        </asp:Panel>

                    </div>

                    

                </div>
            </div>
        </div>
    

</asp:Content>




