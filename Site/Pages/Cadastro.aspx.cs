using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Model;
using DAL.Persistence;

namespace Site.Pages
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrarCliente(object sender, EventArgs e)
        {
            try
            {
                Tarefa t = new Tarefa();
                t.Nome = txtNome.Text;
                t.Tipo = ddltipo.SelectedItem.Text;
                t.Responsavel = txtResponsavel.Text;
                t.DataEntrega = txtDataEntrega.Text;

                TarefaDAO d = new TarefaDAO();

                //Método que grava a tarefa no banco de dados
                d.Gravar(t);
                lblMensagem.Text = "Tarefa " + t.Nome + " gravado com sucesso.";

                txtNome.Text = string.Empty;
                ddltipo.SelectedIndex = 0;
                txtResponsavel.Text = string.Empty;
                txtDataEntrega.Text = string.Empty;
                

            }
            catch (Exception er)
            {
                lblMensagem.Text = er.Message;
            }
        }

        
    }
}