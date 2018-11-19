using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Model;
using DAL.Persistence;

namespace Site.Pages
{
    public partial class Detalhes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panelDados.Visible = false;
        }

        protected void btnPesquisarCliente(object sender, EventArgs e)
        {
            try
            {
                lblMensagem.Text = string.Empty;
                int codigo = Convert.ToInt32(txtCodigo.Text);
                TarefaDAO d = new TarefaDAO();
                Tarefa t = d.ObterPorCodigo(codigo);

                if(t != null)
                {
                    panelDados.Visible = true;
                    txtNome.Text = t.Nome;

                    if (t.Tipo.Equals("Atividade Complementar"))
                        ddltipo.SelectedIndex = 0;
                    else if (t.Tipo.Equals("Dependência"))
                        ddltipo.SelectedIndex = 1;
                    else if (t.Tipo.Equals("Prova"))
                        ddltipo.SelectedIndex = 2;
                    else if (t.Tipo.Equals("Trabalho"))
                        ddltipo.SelectedIndex = 3;
                    else if (t.Tipo.Equals("Outras Atividades"))
                        ddltipo.SelectedIndex = 4;

                    txtResponsavel.Text = t.Responsavel;
                    txtDataEntrega.Text = t.DataEntrega;
                }
                else
                {
                    lblMensagem.Text = "Tarefa não encontrada";
                    txtCodigo.Text = string.Empty;
                }
            }
            catch(Exception ex)
            {
                lblMensagem.Text = ex.Message;
            }
            
        }

        protected void btnExcluirCliente(object sender, EventArgs e)
        {
            try
            {
                int codigo = Convert.ToInt32(txtCodigo.Text);

                Tarefa p = new Tarefa();
                TarefaDAO d = new TarefaDAO();

                d.Excluir(codigo);
                lblMensagem.Text = "Tarefa excluída com sucesso.";

                txtNome.Text = string.Empty;
                ddltipo.SelectedIndex = 0;
                txtResponsavel.Text = string.Empty;
                txtDataEntrega.Text = string.Empty;

            }
            catch (Exception ex)
            {
                lblMensagem.Text = ex.Message;
            }
        }

        protected void btnAtualizarCliente(object sender, EventArgs e)
        {
            try
            {
                
                Tarefa t = new Tarefa();
                t.Codigo = Convert.ToInt32(txtCodigo.Text);
                t.Nome = Convert.ToString(txtNome.Text);
                t.Tipo = ddltipo.SelectedItem.Text;
                t.Responsavel = Convert.ToString(txtResponsavel.Text);
                t.DataEntrega = Convert.ToString(txtDataEntrega.Text); 

                TarefaDAO d = new TarefaDAO();
                d.Atualizar(t);
                lblMensagem.Text = "Tarefa atualizado com sucesso.";

                txtNome.Text = string.Empty;
                ddltipo.SelectedIndex = 0;
                txtResponsavel.Text = string.Empty;
                txtDataEntrega.Text = string.Empty;

            }
            catch (Exception ex)
            {
                lblMensagem.Text = ex.Message;
            }
        }

    }
}