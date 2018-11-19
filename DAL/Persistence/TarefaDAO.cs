using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OleDb;
using System.Data;
using DAL.Model;


namespace DAL.Persistence
{
    // Classe herda de atributos e metodos da classe ConexaoAccess
    public class TarefaDAO: ConexaoAccess
    {
        //Cadastra uma tarefa no banco de dados
        public void Gravar(Tarefa t)
        {
            try
            {
                AbrirConexao();
                Cmd = new OleDbCommand("INSERT INTO tarefa (Nome, Tipo, Responsavel, DataEntrega) values(@v1, @v2, @v3, @v4)", Con);
                Cmd.Parameters.AddWithValue("@v1", t.Nome);
                Cmd.Parameters.AddWithValue("@v2", t.Tipo);
                Cmd.Parameters.AddWithValue("@v3", t.Responsavel);
                Cmd.Parameters.AddWithValue("@v4", t.DataEntrega);

                Cmd.ExecuteNonQuery();


           
            }
            catch (Exception er)
            {
                throw new Exception("Erro ao gravar tarefa: " + er.Message);
            }
            finally
            {
                FecharConexao();
            }

        }

        //Busca uma tarefa no banco de dados informando o código
        public Tarefa ObterPorCodigo(int Codigo)
        {
            try
            {
                AbrirConexao();
                Cmd = new OleDbCommand("SELECT * FROM Tarefa WHERE Codigo=@v1", Con);
                Cmd.Parameters.AddWithValue("@v1", Codigo);
                OleDbDataReader reader = Cmd.ExecuteReader(); // execucao das leitura das informações no banco

                Tarefa t = null;
                if (reader.Read())
                {
                    t = new Tarefa();
                    t.Codigo = Convert.ToInt32(reader["Codigo"]);
                    t.Nome = Convert.ToString(reader["Nome"]);
                    t.Tipo = Convert.ToString(reader["Tipo"]);
                    t.Responsavel = Convert.ToString(reader["Responsavel"]);
                    t.DataEntrega = Convert.ToString(reader["DataEntrega"]).Substring(0,10);
                }
                return t;
            }
            catch (Exception er)
            {
                throw new Exception("Erro ao buscar a tarefa: " + er.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        //Exclui uma tarefa no banco de dados informando o código
        public void Excluir(int Codigo)
        {
            try
            {
                AbrirConexao();
                Cmd = new OleDbCommand("DELETE FROM Tarefa WHERE Codigo = @v1", Con);
                Cmd.Parameters.AddWithValue("@v1", Codigo);
                Cmd.ExecuteNonQuery();

            }
            catch (Exception er)
            {
                throw new Exception("Erro ao excluir a tarefa: " + er.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        //Busca todas as tarefas no banco de dados
        public List<Tarefa> Listar()
        {
            try
            {
                List<Tarefa> lista = new List<Tarefa>();

                DataSet ds = new DataSet();
                AbrirConexao();
                OleDbDataAdapter da = new OleDbDataAdapter("Select * from Tarefa order by Codigo", Con);
                da.Fill(ds);
                Con.Close();
                DataTable dt = ds.Tables[0];
                foreach (DataRow rows in dt.Rows)
                {
                    Tarefa t = new Tarefa();
                    t.Codigo = int.Parse(rows["Codigo"].ToString());
                    t.Nome = rows["Nome"].ToString();
                    t.Tipo = rows["Tipo"].ToString();
                    t.Responsavel = rows["Responsavel"].ToString();
                    t.DataEntrega = rows["DataEntrega"].ToString().Substring(0,10);  
                    lista.Add(t);

                    
                }
                return lista;
            }
            catch (Exception er)
            {
                throw new Exception("Erro ao listar as tarefas :" + er.Message);
            }
            finally
            {
                FecharConexao();
            }


        }

        //Atualiza a tarefa no banco de dados
        public void Atualizar(Tarefa t)
        {
            try
            {
                AbrirConexao();
                Cmd = new OleDbCommand("UPDATE Tarefa SET Nome=@v1, Tipo=@v2, Responsavel=@v3, DataEntrega=@v4 WHERE Codigo=@v5", Con);
                Cmd.Parameters.AddWithValue("@v1", t.Nome);
                Cmd.Parameters.AddWithValue("@v2", t.Tipo);
                Cmd.Parameters.AddWithValue("@v3", t.Responsavel);
                Cmd.Parameters.AddWithValue("@v3", t.DataEntrega);
                Cmd.Parameters.AddWithValue("@v5", t.Codigo);

                Cmd.ExecuteNonQuery();

            }
            catch (Exception er)
            {
                throw new Exception("Erro ao atualizar tarefa: " + er.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        //Busca todas as tarefas que estão expirando na data atual
        public List<Tarefa> ListarPorData(string dataAtual)
        {
            try
            {
                List<Tarefa> lista = new List<Tarefa>();

                DataSet ds = new DataSet();
                AbrirConexao();
                //ESSE SQL FAZ COM QUE AS DATAS SEJAM COMPARADA, ASSIM SABEMOS QUEM ESTÁ, QUAL TAREFA ESTÁ ATRASADA OU NO DIA FINAL DE ENTREGA.
                OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM Tarefa WHERE DataEntrega <= #" + dataAtual + "# order by DataEntrega", Con);
                da.Fill(ds);
                Con.Close();
                DataTable dt = ds.Tables[0];
                foreach (DataRow rows in dt.Rows)
                {
                    Tarefa t = new Tarefa();
                    t.Codigo = int.Parse(rows["Codigo"].ToString());
                    t.Nome = rows["Nome"].ToString();
                    t.Tipo = rows["Tipo"].ToString();
                    t.Responsavel = rows["Responsavel"].ToString();
                    t.DataEntrega = rows["DataEntrega"].ToString().Substring(0, 10);
                    lista.Add(t);


                }
                return lista;
            }
            catch (Exception er)
            {
                throw new Exception("Erro ao listar os clientes :" + er.Message);
            }
            finally
            {
                FecharConexao();
            }

        }

        //Busca as tarefas por datas
        public List<Tarefa> ListarPorDataInicialDataFinal(string dtInicial, string dtFinal) {
            try
            {
                List<Tarefa> lista = new List<Tarefa>();

                DataSet ds = new DataSet();
                AbrirConexao();
                OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM Tarefa WHERE DataEntrega BETWEEN #" + dtInicial + "# AND #" + dtFinal+ "#", Con);
                da.Fill(ds);
                Con.Close();
                DataTable dt = ds.Tables[0];
                foreach (DataRow rows in dt.Rows)
                {
                    Tarefa t = new Tarefa();
                    t.Codigo = int.Parse(rows["Codigo"].ToString());
                    t.Nome = rows["Nome"].ToString();
                    t.Tipo = rows["Tipo"].ToString();
                    t.Responsavel = rows["Responsavel"].ToString();
                    t.DataEntrega = rows["DataEntrega"].ToString().Substring(0, 10);
                    lista.Add(t);


                }
                return lista;
            }
            catch (Exception er)
            {
                throw new Exception("Erro ao listar os clientes :" + er.Message);
            }
            finally
            {
                FecharConexao();
            }






        }


    }
}
