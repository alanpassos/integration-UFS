using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IFormaPagamentos : IRepositorio<FormaPagamento>
    {
        void Cadastrar(FormaPagamento formaPagamento);
        void Atualizar(FormaPagamento formaPagamento);
        void Remover(FormaPagamento formaPagamento);
        FormaPagamento ResultadoUnico(int idFormaPagamento);
    }
}
