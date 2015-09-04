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
    public class Pagamentos : IPagamentos
    {
        private IQueryable<Pagamento> pagamentos;
        private IProjectHotel unidadeTrabalho;

        
        public Pagamentos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.pagamentos = unidadeTrabalho.Pagamentos;
        }

        private Pagamentos(IQueryable<Pagamento> Pagamentos, IProjectHotel unidadeTrabalho)
        {
            this.pagamentos = Pagamentos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Pagamentos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Pagamentos, unidadeTrabalho) { }

        public void Cadastrar(Pagamento Pagamento)
        {
            unidadeTrabalho.RegistrarNovo(Pagamento);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Pagamento Pagamento)
        {
            unidadeTrabalho.RegistrarAlterado(Pagamento);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Pagamento Pagamento)
        {
            unidadeTrabalho.RegistrarRemovido(Pagamento);
            unidadeTrabalho.Salvar();
        }

        public Pagamento ResultadoUnico(int idPagamento)
        {
            return pagamentos.SingleOrDefault(c => c.numeroParcela== idPagamento);
        }

        public ICollection<Pagamento> Listar()
        {
            return pagamentos.OrderBy(p => p.status).ToList();
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
