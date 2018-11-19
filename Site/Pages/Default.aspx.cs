using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Persistence;

namespace Site
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                string DataAtual = DateTime.Now.ToString("MM/dd/yyyy");
                TarefaDAO d = new TarefaDAO();

                //Popula a Grid das tarefas que expiram na data de hoje
                gridDatas.DataSource = d.ListarPorData(DataAtual); //popular a grid
                gridDatas.DataBind(); //exibir conteudo da grid

            }
            catch (Exception ex)
            {
                lblMensagem.Visible = true;
                lblMensagem.Text = ex.Message;
            }

        }
        

    }    
    
}
