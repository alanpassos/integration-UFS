using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Classes_Especiais;

namespace Infraestrutura.Repositorio
{
    public class ControleServicos : IControleServicos
    {
        private IQueryable<ControleServico> controleServicos;
        private IQueryable<Quarto> quarto;
        private IQueryable<Hospedagem> hospedagem;
        private IQueryable<Servico> servico;
        private IProjectHotel unidadeTrabalho;
        

        private ControleServicos(IQueryable<ControleServico> controleServicos, IProjectHotel unidadeTrabalho)
        {
            this.controleServicos = controleServicos;
            this.unidadeTrabalho = unidadeTrabalho;
            this.quarto = unidadeTrabalho.Quartos;
            this.servico = unidadeTrabalho.Servicos;
            this.hospedagem = unidadeTrabalho.Hospedagens;
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
            return controleServicos.SingleOrDefault(c => c.idServico== idServico);
        }

        public ICollection<ControleServico> Listar()
        {
            return controleServicos.OrderBy(p => p.idHospedagem).ToList();
        }
        /*
        public ICollection<ServicoHospedagem> ListarServicoHospedagem(int idHospedagem)
        {
            IQueryable<ServicoHospedagem> servicosHospedagem = 
                from h in hospedagem 
                join q in quarto on h.idQuarto equals q.idQuarto
                join cs in controleServicos on h.idHospedagem equals cs.idHospedagem
                join s in servico on cs.idServico equals s.idServico
                where cs.idHospedagem == idHospedagem
                group h by new { 

                    q.descricao,
                    cs.dataAbertura.

                } 






            return 
        }
         */
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
