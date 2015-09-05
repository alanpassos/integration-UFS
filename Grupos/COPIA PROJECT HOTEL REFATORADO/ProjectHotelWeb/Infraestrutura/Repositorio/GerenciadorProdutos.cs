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
    public class GerenciadorProdutos : IGerenciadorProdutos
    {
        private IQueryable<ProdutoModel> produtos;
        private IProjectHotel unidadeTrabalho;

        
        public GerenciadorProdutos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.produtos = unidadeTrabalho.Produtos;
        }

        private GerenciadorProdutos(IQueryable<ProdutoModel> Produtos, IProjectHotel unidadeTrabalho)
        {
            this.produtos = Produtos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public GerenciadorProdutos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Produtos, unidadeTrabalho) { }

        public int Cadastrar(ProdutoModel Produto)
        {
            unidadeTrabalho.RegistrarNovo(Produto);
            unidadeTrabalho.Salvar();
            return produtos.Max(p => p.idProduto);
        }

        public void Atualizar(ProdutoModel Produto)
        {
            unidadeTrabalho.RegistrarAlterado(Produto);
            unidadeTrabalho.Salvar();
        }

        public void Remover(ProdutoModel Produto)
        {
            unidadeTrabalho.RegistrarRemovido(Produto);
            unidadeTrabalho.Salvar();
        }

        public ProdutoModel ResultadoUnico(int idProduto)
        {
            return produtos.SingleOrDefault(c => c.idProduto == idProduto);
        }

        public ICollection<ProdutoModel> Listar()
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
