using Dominio.Classes;
using Dominio.Classes_Especiais;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface ITipoQuartos : IRepositorio<TipoQuarto>
    {
        void Cadastrar(TipoQuarto tipoQuarto);
        void Atualizar(TipoQuarto tipoQuarto);
        void Remover(TipoQuarto tipoQuarto);
        TipoQuarto ResultadoUnico(int idTipoQuarto);
        ICollection<QuartosLivresReserva> ListaLivres(string tipoQuartoPesquisa, string pessoasPesquisa, DateTime dataInicio, DateTime dataFim);
        ICollection<int> ListaQuartosTipo(string tipoQuartoPesquisa, string pessoasPesquisa);
        ICollection<QuartosLivresReserva> ListaTiposReservadosCliente(int idCliente);
    }
}
