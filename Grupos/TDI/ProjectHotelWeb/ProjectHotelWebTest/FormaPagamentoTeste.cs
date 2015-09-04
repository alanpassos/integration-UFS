using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class FormaPagamentoTeste
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
            int idFormaPagamentoExpected = 0;
            FormaPagamentos formaPagamento = new FormaPagamentos();
            FormaPagamento formaPagamentoExpected = new FormaPagamento();

            formaPagamentoExpected.descricao = "Avista";
            formaPagamentoExpected.observacao = "Avista";
            formaPagamentoExpected.tipo = "Avista";

            idFormaPagamentoExpected = formaPagamento.Cadastrar(formaPagamentoExpected);

            FormaPagamento formaPagamentoCadastrado = formaPagamento.ResultadoUnico(idFormaPagamentoExpected);
            Assert.IsNotNull(formaPagamentoCadastrado);
            Assert.IsInstanceOfType(formaPagamentoCadastrado, typeof(FormaPagamento));
            Assert.AreEqual(formaPagamentoExpected, formaPagamentoCadastrado);

        }

        [TestMethod]
        public void AtualizarTeste()
        {
            int idFormaPagamento = 10;
            FormaPagamentos formaPagamentos = new FormaPagamentos();
            FormaPagamento formaPagamento = formaPagamentos.ResultadoUnico(idFormaPagamento);
            Assert.IsNotNull(formaPagamento);
            formaPagamento.descricao = "A vista";
            formaPagamento.observacao = "A vista";
            formaPagamentos.Atualizar(formaPagamento);

            FormaPagamento formaPagamentoAtualizado = formaPagamentos.ResultadoUnico(idFormaPagamento);
            Assert.AreEqual(formaPagamento, formaPagamentoAtualizado);
        }
    }
}
