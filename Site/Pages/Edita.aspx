<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Edita.aspx.cs" Inherits="Site.Pages.Teste" %>

  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
            <div class="span10 offset1">
                <div class="row">
                    <h3 class="well" style="text-align:center">Editar Tarefas</h3>    

                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" BackColor="#D8E4E4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None" OnRowDeleting="GridView1_RowDeleting">
                            <AlternatingRowStyle BorderStyle="None" />
                            <Columns>
            
                                <asp:BoundField DataField="Codigo" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            
            
            
                                <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Tipo" DataValueField="Tipo" SelectedValue='<%# Bind("Tipo") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBanco %>" ProviderName="<%$ ConnectionStrings:conexaoBanco.ProviderName %>" SelectCommand="SELECT DISTINCT [Tipo] FROM [Tarefa]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="Responsavel" HeaderText="Responsável" SortExpression="Responsavel" />

                                <asp:TemplateField HeaderText="Data da entrega" SortExpression="DataEntrega">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDataEntrega" runat="server" DataSourceID="SqlDataSource3" CssClass="date" placeholder="DD/MM/AAAA" MaxLength="10" DataTextField="DataEntrega" DataValueField="DataEntrega" Text='<%# Bind("DataEntrega","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBanco %>" ProviderName="<%$ ConnectionStrings:conexaoBanco.ProviderName %>" SelectCommand="SELECT [DataEntrega] FROM [Tarefa]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DataEntrega","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modificações" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Você tem certeza que deseja deletar este registro ?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EditRowStyle BorderStyle="None" />
                            <EmptyDataRowStyle BorderStyle="None" />
                            <FooterStyle BorderStyle="None" />
                            <HeaderStyle BorderStyle="None" />
                            <PagerStyle BorderStyle="None" />
                            <RowStyle BorderStyle="None" />
                            <SelectedRowStyle BorderStyle="None" />
                            <SortedAscendingCellStyle BorderStyle="None" />
                            <SortedAscendingHeaderStyle BorderStyle="None" />
                            <SortedDescendingCellStyle BorderStyle="None" />
                            <SortedDescendingHeaderStyle BorderStyle="None" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBanco %>" ProviderName="<%$ ConnectionStrings:conexaoBanco.ProviderName %>" SelectCommand="SELECT * FROM [Tarefa]" DeleteCommand="DELETE FROM [Tarefa] WHERE [Codigo] = ?" InsertCommand="INSERT INTO [Tarefa] ([Codigo], [Nome], [Tipo], [Responsavel], [DataEntrega]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Tarefa] SET [Nome] = ?, [Tipo] = ?, [Responsavel] = ?, [DataEntrega] = ? WHERE [Codigo] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="Codigo" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Codigo" Type="Int32" />
                                <asp:Parameter Name="Nome" Type="String" />
                                <asp:Parameter Name="Tipo" Type="String" />
                                <asp:Parameter Name="Responsavel" Type="String" />
                                <asp:Parameter Name="DataEntrega" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nome" Type="String" />
                                <asp:Parameter Name="Tipo" Type="String" />
                                <asp:Parameter Name="Responsavel" Type="String" />
                                <asp:Parameter Name="DataEntrega" Type="DateTime" />
                                <asp:Parameter Name="Codigo" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
        </div>

</asp:Content>


