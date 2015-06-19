using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class Produto
    {
       public int idProduto { get; set; }
       public double tamanho { get; set; }
       public int quantidade { get; set; }
       public string descricao { get; set; }
       public string observacao { get; set; }
       public double valor { get; set; }
    }
}
