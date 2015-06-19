using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class Hospedagem
    {
       public int idHospedagem { get; set; }
       public int idPacoteHospedagem { get; set; }
       public int idQuarto { get; set; }
       public DateTime dataAbertura { get; set; }
       public DateTime dataLiberacao { get; set; }
       public string placaVeiculo { get; set; }
       public string observacao { get; set; }
       public double valorHospedagem { get; set; }
       public bool aberto { get; set; }

    }
}
