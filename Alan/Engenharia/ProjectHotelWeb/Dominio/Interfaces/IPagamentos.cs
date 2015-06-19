using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IPagamentos : IRepositorio<Pagamento>
    {
        void Cadastrar(Pagamento pagamento);
        void Atualizar(Pagamento pagamento);
        void Remover(Pagamento pagamento);
        Pagamento ResultadoUnico(int idPagamento);
    }
}
