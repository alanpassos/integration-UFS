﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class Pagamento
    {
       public int numeroParcela { get; set; }
       public int idFormaPagamento { get; set; }
       public int idPacoteHospedagem { get; set; }
       public DateTime dataCadastro { get; set; }
       public DateTime dataPrevista { get; set; }
       public DateTime? dataPagamento { get; set; }
       public decimal valorParcela{ get; set; }
       public string status { get; set; }


       public virtual FormaPagamento FormaPagamento { get; set; }

       public virtual PacoteHospedagem PacoteHospedagem{ get; set; }
    }
}
