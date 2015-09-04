using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    /// <summary>
    /// Summary description for ServicoTest
    /// </summary>
    [TestClass]
    public class ServicoTest
    {
        public ServicoTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        Servicos gServicos = new Servicos();
        ServicoModel newServico;


        #endregion

        [TestMethod]
        public void CadastrarServicoValidoTest()
        {

            newServico = new ServicoModel();
            newServico.descricao = "NOVO SERVICO TESTE";
            newServico.valor = 56;
            newServico.ativo = true;
            gServicos.Cadastrar(newServico);


        }

        [TestMethod]
        public void AtualizarServicoValidoTest()
        {
            newServico = new ServicoModel();
            newServico = gServicos.ResultadoUnico(1);
            newServico.ativo = false;
            gServicos.Atualizar(newServico);

        }

    }
}
