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
    public class Historicos : IHistoricos
    {
        private IQueryable<Historico> historicos;
        private IProjectHotel unidadeTrabalho;

        private Historicos(IQueryable<Historico> historicos, IProjectHotel unidadeTrabalho)
        {
            this.historicos = historicos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Historicos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Historicos, unidadeTrabalho) { }

        public void Cadastrar(Historico historico)
        {
            unidadeTrabalho.RegistrarNovo(historico);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Historico historico)
        {
            unidadeTrabalho.RegistrarAlterado(historico);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Historico historico)
        {
            unidadeTrabalho.RegistrarRemovido(historico);
            unidadeTrabalho.Salvar();
        }

        public Historico ResultadoUnico(int idHistorico)
        {
            return historicos.SingleOrDefault(c => c.idHistorico == idHistorico);
        }

        public ICollection<Historico> Listar()
        {
            return historicos.OrderBy(p => p.descricao).ToList();
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
