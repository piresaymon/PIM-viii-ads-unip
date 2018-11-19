using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        private static string opcao;

        protected void Page_Load(object sender, EventArgs e)
        {

            lblDataAtual.Text = DateTime.Now.ToString("dd/MM/yyyy");

            if (!IsPostBack)
                ddlMenu.SelectedValue = opcao;
            
        }

        

        protected void ddlMenu_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Capturar o valor selecionado na Dropdown List
            opcao = ddlMenu.SelectedValue;

            switch (opcao)
            {
                case "0":
                    Response.Redirect("Default.aspx", false);
                    break;
                case "1":
                    Response.Redirect("/Pages/Cadastro.aspx", false);
                    break;
                case "2":
                    Response.Redirect("/Pages/Consulta.aspx", false);
                    break;
                case "3":
                    Response.Redirect("/Pages/Edita.aspx", false);
                    break;
            }
            


        }
    }
}