
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
    public class Servicos : IServicos
    {
        private IQueryable<Servico> servicos;
        private IProjectHotel unidadeTrabalho;

        
        public Servicos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.servicos = unidadeTrabalho.Servicos;
        }

        private Servicos(IQueryable<Servico> servicos, IProjectHotel unidadeTrabalho)
        {
            this.servicos = servicos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Servicos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) : 
               this(iHotelWeb.Servicos, unidadeTrabalho) { }

        public int Cadastrar(Servico servico)
        {
            unidadeTrabalho.RegistrarNovo(servico);
            unidadeTrabalho.Salvar();
            return servicos.Max(p => p.idServico);
        }

        public void Atualizar(Servico servico)
        {
            unidadeTrabalho.RegistrarAlterado(servico);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Servico servico)
        {
            unidadeTrabalho.RegistrarRemovido(servico);
            unidadeTrabalho.Salvar();
        }

        public Servico ResultadoUnico(int idServico)
        {
            return servicos.SingleOrDefault(s => s.idServico== idServico);
        }

        public ICollection<Servico> Listar()
        {
            return servicos.OrderBy(p => p.descricao).ToList();
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
