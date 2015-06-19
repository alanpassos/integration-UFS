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
    public class ControleServicos : IControleServicos
    {
        private IQueryable<ControleServico> controleServicos;
        private IProjectHotel unidadeTrabalho;

        private ControleServicos(IQueryable<ControleServico> controleServicos, IProjectHotel unidadeTrabalho)
        {
            this.controleServicos = controleServicos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public ControleServicos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.ControleServicos, unidadeTrabalho) { }

        public void Cadastrar(ControleServico controleServico)
        {
            unidadeTrabalho.RegistrarNovo(controleServico);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(ControleServico controleServico)
        {
            unidadeTrabalho.RegistrarAlterado(controleServico);
            unidadeTrabalho.Salvar();
        }

        public void Remover(ControleServico controleServico)
        {
            unidadeTrabalho.RegistrarRemovido(controleServico);
            unidadeTrabalho.Salvar();
        }

        public ControleServico ResultadoUnico(int idServico)
        {
            return controleServicos.SingleOrDefault(c => c.idServido== idServico);
        }

        public ICollection<ControleServico> Listar()
        {
            return controleServicos.OrderBy(p => p.idHospedagem).ToList();
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
