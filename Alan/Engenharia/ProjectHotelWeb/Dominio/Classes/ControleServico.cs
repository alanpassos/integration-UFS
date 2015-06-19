using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class ControleServico
    {
       public int idHospedagem { get; set; }
       public int idServido { get; set; }
       public int idFuncionario { get; set; }
       public DateTime dataAbertura { get; set; }
       public DateTime dataLiberacao { get; set; }
       public DateTime dataCadastro { get; set; }
       public bool cancelado { get; set; }
    }
}
