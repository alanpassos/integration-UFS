using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IHistoricos : IRepositorio<Historico>
    {
        void Cadastrar(Historico historico);
        void Atualizar(Historico historico);
        void Remover(Historico historico);
        Historico ResultadoUnico(int idHisotirco);
    }
}
