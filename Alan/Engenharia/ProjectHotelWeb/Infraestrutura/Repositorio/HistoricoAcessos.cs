using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Repositorio
{
    public class HistoricoAcessoAcessos : IHistoricoAcessos
    {
        private IQueryable<HistoricoAcesso> historicoAcessos;
        private IProjectHotel unidadeTrabalho;

        private HistoricoAcessoAcessos (IQueryable<HistoricoAcesso> historicoAcessos, IProjectHotel unidadeTrabalho)
        {
            this.historicoAcessos = historicoAcessos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public HistoricoAcessoAcessos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.HistoricoAcessos, unidadeTrabalho) { }

        public void Cadastrar(HistoricoAcesso historicoAcesso)
        {
            unidadeTrabalho.RegistrarNovo(historicoAcesso);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(HistoricoAcesso historicoAcesso)
        {
            unidadeTrabalho.RegistrarAlterado(historicoAcesso);
            unidadeTrabalho.Salvar();
        }

        public void Remover(HistoricoAcesso historicoAcesso)
        {
            unidadeTrabalho.RegistrarRemovido(historicoAcesso);
            unidadeTrabalho.Salvar();
        }

        public HistoricoAcesso ResultadoUnico(int idHistoricoAcesso)
        {
            return historicoAcessos.SingleOrDefault(c => c.idHistoricoAcesso == idHistoricoAcesso);
        }

        public ICollection<HistoricoAcesso> Listar()
        {
            return historicoAcessos.OrderBy(p => p.observacao).ToList();
        }

        public bool ContemRegistro()
        {
            throw new NotImplementedException();
        }

        public int TotalRegistros()
        {
            throw new NotImplementedException();
        }
    }
}
