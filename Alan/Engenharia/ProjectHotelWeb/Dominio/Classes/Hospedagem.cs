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
       public decimal valorHospedagem { get; set; }
       public bool aberto { get; set; }


       public virtual List<ControleCliente> ControleCliente { get; set; }
       public virtual List<Item> Item { get; set; }
       public virtual List<ControleServico> ControleServico { get; set; }
       
       
       
       
       public virtual PacoteHospedagem PacoteHospedagem { get; set; }
       public virtual Quarto Quarto { get; set; }

       


    }
}
