using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class ServicoTeste
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
            int idServicoExpected = 0;
            Servicos servicos = new Servicos();
            Servico servicoExpected = new Servico();

            servicoExpected.descricao = "Lavanderia";
            servicoExpected.observacao = "Observação";
            servicoExpected.valor = 100;

            idServicoExpected = servicos.Cadastrar(servicoExpected);

            Servico servicoCadastrado = servicos.ResultadoUnico(idServicoExpected);
            Assert.IsNotNull(servicoCadastrado);
            Assert.IsInstanceOfType(servicoCadastrado, typeof(Servico));
            Assert.AreEqual(servicoExpected, servicoCadastrado);

        }

        [TestMethod]
        public void AtualizarTeste()
        {
            int idServico = 1;
            Servicos servicos = new Servicos();
            Servico servico = servicos.ResultadoUnico(idServico);
            Assert.IsNotNull(servico);
            servico.descricao = "Lavanderia Refinada";
            servico.valor = 123;
            servicos.Atualizar(servico);

            Servico servicoAtualizado = servicos.ResultadoUnico(idServico);
            Assert.AreEqual(servico, servicoAtualizado);
        }
    }
}
