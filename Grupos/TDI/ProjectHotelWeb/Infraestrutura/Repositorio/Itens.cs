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
    public class Itens : IItens
    {
        private IQueryable<Item> itens;
        private IProjectHotel unidadeTrabalho;

        private Itens(IQueryable<Item> itens, IProjectHotel unidadeTrabalho)
        {
            this.itens = itens;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Itens(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Itens, unidadeTrabalho) { }

        public void Cadastrar(Item historico)
        {
            unidadeTrabalho.RegistrarNovo(historico);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Item historico)
        {
            unidadeTrabalho.RegistrarAlterado(historico);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Item historico)
        {
            unidadeTrabalho.RegistrarRemovido(historico);
            unidadeTrabalho.Salvar();
        }

        public Item ResultadoUnico(int idItem)
        {
            return itens.SingleOrDefault(c => c.idItem == idItem);
        }

        public ICollection<Item> Listar()
        {
            return itens.OrderBy(p => p.quantidade).ToList();
        }

        public ICollection<Item> ListarItemPorHspedagem(int idHospedagem)
        {
            return itens.Where(p => p.cancelado == false && p.idHospedagem == idHospedagem).OrderBy(p => p.quantidade).ToList();
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
