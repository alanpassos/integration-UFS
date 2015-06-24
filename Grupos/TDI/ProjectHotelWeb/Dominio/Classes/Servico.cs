using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class Servico
    {
       public int idServico { get; set; }
       public string descricao { get; set; }
       public string observacao { get; set; }
       public decimal valor { get; set; }
       public bool ativo { get; set; }

       public virtual List<ControleServico> ControleServico { get; set; }
    }
}
