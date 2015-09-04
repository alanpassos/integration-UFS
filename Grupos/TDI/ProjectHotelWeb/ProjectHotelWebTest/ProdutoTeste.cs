using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class ProdutoTeste
    {

        private TestContext testContextInstance;

        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestMethod]
        public void CadastrarTeste()
        {
            int idProdutoExpected = 0;
            Produtos Produtos = new Produtos();
            Produto produtoExpected = new Produto();

            produtoExpected.quantidade = 4;
            produtoExpected.descricao = "Refrigerante";
            produtoExpected.observacao = "Observação";
            produtoExpected.tamanho = "2 litros";
            produtoExpected.valor = 100;

            idProdutoExpected = Produtos.Cadastrar(produtoExpected);

            Produto produtoCadastrado = Produtos.ResultadoUnico(idProdutoExpected);
            Assert.IsNotNull(produtoCadastrado);
            Assert.IsInstanceOfType(produtoCadastrado, typeof(Produto));
            Assert.AreEqual(produtoExpected, produtoCadastrado);

        }

        [TestMethod]
        public void AtualizarTeste()
        {
            int idProduto = 1;
            Produtos Produtos = new Produtos();
            Produto produto = Produtos.ResultadoUnico(idProduto);
            Assert.IsNotNull(produto);
            produto.descricao = "Guaraná";
            produto.tamanho = "1 litro";
            Produtos.Atualizar(produto);

            Produto produtoAtualizado = Produtos.ResultadoUnico(idProduto);
            Assert.AreEqual(produto, produtoAtualizado);
        }

    }
}
