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
    public class Produtos : IProdutos
    {
        private IQueryable<Produto> produtos;
        private IProjectHotel unidadeTrabalho;

        
        public Produtos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.produtos = unidadeTrabalho.Produtos;
        }

        private Produtos(IQueryable<Produto> Produtos, IProjectHotel unidadeTrabalho)
        {
            this.produtos = Produtos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Produtos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Produtos, unidadeTrabalho) { }

        public void Cadastrar(Produto Produto)
        {
            unidadeTrabalho.RegistrarNovo(Produto);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Produto Produto)
        {
            unidadeTrabalho.RegistrarAlterado(Produto);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Produto Produto)
        {
            unidadeTrabalho.RegistrarRemovido(Produto);
            unidadeTrabalho.Salvar();
        }

        public Produto ResultadoUnico(int idProduto)
        {
            return produtos.SingleOrDefault(c => c.idProduto == idProduto);
        }

        public ICollection<Produto> Listar()
        {
            return produtos.OrderBy(p => p.descricao).ToList();
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
