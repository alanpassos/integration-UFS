using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
  public  class ControleCliente
    {
      public int idCliente { get; set; }
      public int idHospedagem { get; set; }
      public DateTime dataCadastro { get; set; }


      public virtual Pessoa Pessoa { get; set; }
      public virtual Hospedagem Hospedagem { get; set; }
      
    }
}
