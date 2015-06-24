using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class Quarto
    {
       public int idQuarto { get; set; }
       public int idTipoQuarto { get; set; }
       public string descricao { get; set; }
       public int capacidade { get; set; }
       public bool ativo { get; set; }
       public string status { get; set; }

       

       public virtual List<Hospedagem> Hospedagem { get; set; }
       public virtual TipoQuarto TipoQuarto { get; set; }
    }
}
