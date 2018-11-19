using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Model;
using DAL.Persistence;

namespace Site.Pages
{
    public partial class Consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    TarefaDAO d = new TarefaDAO();
                    gridTarefas.DataSource = d.Listar(); //popular a grid
                    gridTarefas.DataBind(); //exibir conteudo da grid

                }
                catch (Exception ex)
                {
                    lblMensagem.Text = ex.Message;
                }
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {

            try
            {
                lblMensagem.Text = "";
                DateTime dataInicial = DateTime.ParseExact(txtDataInicial.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime dataFinal = DateTime.ParseExact(txtDataFinal.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                if (dataInicial.CompareTo(dataFinal) == 1)
                {
                    lblMensagem.Text = "Data Final é menor que a Data Inicial";
                    gridTarefas.DataSource = null;
                    gridTarefas.DataBind();
                    return;
                }

                TarefaDAO t = new TarefaDAO();
                gridTarefas.DataSource = t.ListarPorDataInicialDataFinal(dataInicial.ToString("MM/dd/yyyy"), dataFinal.ToString("MM/dd/yyyy"));
                gridTarefas.DataBind();

            }
            catch (Exception ex)
            {
                lblMensagem.Text = ex.Message;
            }


        }


    }

}
