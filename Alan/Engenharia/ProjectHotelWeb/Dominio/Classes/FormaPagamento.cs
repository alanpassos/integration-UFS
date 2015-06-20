using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
  public  class FormaPagamento
    {
      public int idFormaPagamento { get; set; }
      public string descricao { get; set; }
      public string observacao {get;set;}
      public int numeroMaximoParcela { get; set; }
      public bool ativo { get; set; }

      public virtual List<Pagamento> Pagamento { get; set; }
    }
}
