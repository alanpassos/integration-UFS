using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class ControleServico
    {
       public int idControleServico { get; set; }
       public int idHospedagem { get; set; }
       public int idServico { get; set; }
       public int idFuncionario { get; set; }
       public DateTime dataAbertura { get; set; }
       public DateTime dataLiberacao { get; set; }
       public DateTime dataCadastro { get; set; }
       public bool cancelado { get; set; }
       
       
       public virtual Hospedagem Hospedagem { get; set; }       
       public virtual Pessoa Pessoa { get; set; }
       public virtual Servico Servico { get; set; }


    }
}
