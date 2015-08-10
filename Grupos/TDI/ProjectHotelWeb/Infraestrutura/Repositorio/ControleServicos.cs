using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Classes_Especiais;
using System.Data.Entity;




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

        public ICollection<ServicoHospedagem> ListarServicoHospedagem(int idHospedagem)
        {
            IQueryable<ServicoHospedagem> servicosHospedagem = 
                from h in hospedagem 
                join q in quarto on h.idQuarto equals q.idQuarto
                join cs in controleServicos on h.idHospedagem equals cs.idHospedagem
                join s in servico on cs.idServico equals s.idServico
                where cs.idHospedagem == idHospedagem && !cs.cancelado
                group h by new {
                    cs.idServico,
                    q.descricao,
                    data = DbFunctions.TruncateTime(
                    cs.dataAbertura),
                    s.valor,
                    servico = s.descricao 
                } into servicoHospedagem 
                select new ServicoHospedagem{
                    idServico = servicoHospedagem.Key.idServico,
                 dataAbertura = servicoHospedagem.Key.data,
                 quantidade = servicoHospedagem.Count(),
                 quarto = servicoHospedagem.Key.descricao,
                 servico = servicoHospedagem.Key.servico,
                valor = servicoHospedagem.Key.valor,
                valorTotal = (servicoHospedagem.Key.valor * servicoHospedagem.Count())
                };

            return servicosHospedagem.ToList(); 
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
