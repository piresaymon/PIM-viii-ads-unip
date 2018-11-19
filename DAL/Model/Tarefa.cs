using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Model
{
    public class Tarefa
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Tipo { get; set; }
        public string Responsavel { get; set; }
        public string DataEntrega { get; set; }

       
    }

}
