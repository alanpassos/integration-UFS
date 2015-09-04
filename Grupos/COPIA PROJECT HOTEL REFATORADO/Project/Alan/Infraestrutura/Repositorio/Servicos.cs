
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
        private IQueryable<ServicoModel> servicos;
        private IProjectHotel unidadeTrabalho;

        
        public Servicos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.servicos = unidadeTrabalho.Servicos;
        }

        private Servicos(IQueryable<ServicoModel> servicos, IProjectHotel unidadeTrabalho)
        {
            this.servicos = servicos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Servicos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) : 
               this(iHotelWeb.Servicos, unidadeTrabalho) { }

        public void Cadastrar(ServicoModel servico)
        {
            unidadeTrabalho.RegistrarNovo(servico);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(ServicoModel servico)
        {
            unidadeTrabalho.RegistrarAlterado(servico);
            unidadeTrabalho.Salvar();
        }

        public void Remover(ServicoModel servico)
        {
            unidadeTrabalho.RegistrarRemovido(servico);
            unidadeTrabalho.Salvar();
        }

        public ServicoModel ResultadoUnico(int idServico)
        {
            return servicos.SingleOrDefault(s => s.idServico== idServico);
        }

        public ICollection<ServicoModel> Listar()
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
