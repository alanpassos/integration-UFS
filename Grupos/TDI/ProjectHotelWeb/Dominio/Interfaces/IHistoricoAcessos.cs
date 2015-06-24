using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IHistoricoAcessos : IRepositorio<HistoricoAcesso>
    {
        void Cadastrar(HistoricoAcesso historicoAcesso);
        void Atualizar(HistoricoAcesso historicoAcesso);
        void Remover(HistoricoAcesso historicoAcesso);
        HistoricoAcesso ResultadoUnico(int idHistoricoAcesso);
    }
}
