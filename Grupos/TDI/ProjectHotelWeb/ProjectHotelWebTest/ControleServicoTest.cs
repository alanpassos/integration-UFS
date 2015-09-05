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
    public class ControleServicoTest
    {
        public ControleServicoTest()
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
        ControleServicos gControleServicos = new ControleServicos();
        Hospedagens gHospedagens = new Hospedagens();
        Servicos gServicos = new Servicos();
        Pessoas gPessoas = new Pessoas();

        ControleServico controleServico;
        Hospedagem hospedagem;
        Servico servico;
        Pessoa funcionario;


        #endregion

        [TestMethod]
        public void CadastrarControleServicoValidoTest()
        {
            hospedagem = new Hospedagem();
            funcionario = new Pessoa();
            servico = new Servico();
            controleServico = new ControleServico();
            hospedagem = gHospedagens.ResultadoUnico(1);            
            servico = gServicos.ResultadoUnico(1);            
            funcionario = gPessoas.ResultadoUnicoFuncionario(2);

            controleServico.idHospedagem = hospedagem.idHospedagem;
            controleServico.idServico = servico.idServico;
            controleServico.idFuncionario = funcionario.idPessoa;
            controleServico.dataCadastro = DateTime.Now;
            controleServico.dataAbertura = DateTime.Now;
            controleServico.dataLiberacao = controleServico.dataCadastro.AddDays(1);
            controleServico.cancelado = false;

            gControleServicos.Cadastrar(controleServico);


        }

        [TestMethod]
        public void AtualizarControleServicoValidoTest()
        {
            hospedagem = new Hospedagem();
            funcionario = new Pessoa();
            servico = new Servico();
            controleServico = new ControleServico();
            hospedagem = gHospedagens.ResultadoUnico(1);
            servico = gServicos.ResultadoUnico(1);
            funcionario = gPessoas.ResultadoUnicoFuncionario(2);

            controleServico = gControleServicos.ResultadoUnico(1);
            controleServico.cancelado = true;

            gControleServicos.Cadastrar(controleServico);
        }

    }
}
