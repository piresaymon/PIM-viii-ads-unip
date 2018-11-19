using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

namespace DAL.Controller
{
    public class Conexao
    {
        
        protected OleDbConnection Con;
        protected OleDbCommand Cmd;
        protected OleDbDataAdapter Da;

        protected void AbrirConexao()
        {
            try
            {
                //Busca a string de conexão com o banco no arquivo Web.config
                Con = new OleDbConnection(ConfigurationManager.ConnectionStrings["accessdb"].ConnectionString);
                Con.Open();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao abrir conexão com banco de dados: " + ex.Message);
            }

        }

        protected void FecharConexao()
        {
            try
            {
                Con.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao fechar conexão com banco de dados: " + ex.Message);
            }
        }

    

    }
}
