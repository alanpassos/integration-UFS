﻿using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes_Especiais
{
    public class TipoPagamento
    {
        public FormaPagamento formaPagamentosAtuais { get; set; }
        public decimal valorPago { get; set; }
        public TipoPagamento()
        {
            formaPagamentosAtuais = new FormaPagamento();
            valorPago = 0;
        }
    }
}
