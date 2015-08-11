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
    public class FormaPagamentos : IFormaPagamentos
    {
        private IQueryable<FormaPagamento> formaPagamentos;
        private IProjectHotel unidadeTrabalho;

        private FormaPagamentos(IQueryable<FormaPagamento> formaPagamentos, IProjectHotel unidadeTrabalho)
        {
            this.formaPagamentos = formaPagamentos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public FormaPagamentos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.FormaPagamentos, unidadeTrabalho) { }

        public void Cadastrar(FormaPagamento formaPagamento)
        {
            unidadeTrabalho.RegistrarNovo(formaPagamento);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(FormaPagamento formaPagamento)
        {
            unidadeTrabalho.RegistrarAlterado(formaPagamento);
            unidadeTrabalho.Salvar();
        }

        public void Remover(FormaPagamento formaPagamento)
        {
            unidadeTrabalho.RegistrarRemovido(formaPagamento);
            unidadeTrabalho.Salvar();
        }

        public FormaPagamento ResultadoUnico(int idFormaPagamento)
        {
            return formaPagamentos.SingleOrDefault(c => c.idFormaPagamento== idFormaPagamento);
        }
        public List<FormaPagamento> ResultadoUnicoTipo(string tipo)
        {
            return formaPagamentos.Where(c => c.tipo== tipo).ToList();
        }

        public ICollection<FormaPagamento> Listar()
        {
            return formaPagamentos.OrderBy(p => p.descricao).ToList();
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
