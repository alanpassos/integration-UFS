using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes_Especiais
{
    public class SuperPagamento
    {
        public List<Hospedagem> hospedagensIniciais { get; set; }
        public List<FormaPagamento> formaPagamentosSelecionados { get; set; }
        
        public List<Pessoa> pessoasSelecionadas { get; set; }
        public decimal valorTotal { get; set; }

        public SuperPagamento()
        {
            hospedagensIniciais = new List<Hospedagem>();
            formaPagamentosSelecionados = new List<FormaPagamento>();
            pessoasSelecionadas = new List<Pessoa>();
            valorTotal =  0;
            

        }
    }
}
