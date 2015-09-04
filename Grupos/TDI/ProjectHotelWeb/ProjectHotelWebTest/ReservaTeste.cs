using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class ReservaTeste
    {

        private TestContext testContextInstance;

        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestMethod]
        public void CadastrarTest()
        {
            int idPacoteHospedagem = 0;
            PacoteHospedagem pacoteHospedagem = new PacoteHospedagem();
            PacoteHospedagens IPacoteHospedagem = new PacoteHospedagens();

            pacoteHospedagem.valorTotal = 0;
            pacoteHospedagem.subTotal = 0;
            pacoteHospedagem.dataCadastro = DateTime.Now;
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "R";

            try
            {
                idPacoteHospedagem = IPacoteHospedagem.Cadastrar(pacoteHospedagem);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(Exception));
            }

            PacoteHospedagem pacoteHospedagemCadastrado = IPacoteHospedagem.ResultadoUnicoReserva(idPacoteHospedagem);
            Assert.IsNotNull(pacoteHospedagemCadastrado);
            Assert.IsInstanceOfType(pacoteHospedagemCadastrado, typeof(PacoteHospedagem));
            Assert.AreEqual(pacoteHospedagem, pacoteHospedagemCadastrado);

            int idHospedagem = 0;
            int idQuarto = 1;
            Hospedagem hospedagem = new Hospedagem();
            Hospedagens IHospedagem = new Hospedagens();

            hospedagem.aberto = true;
            hospedagem.idPacoteHospedagem = idPacoteHospedagem;
            hospedagem.dataAbertura = DateTime.Now;
            hospedagem.dataLiberacao = DateTime.Now;
            hospedagem.idQuarto = idQuarto;
            hospedagem.valorHospedagem = 0;
            try
            {
                idHospedagem = IHospedagem.Cadastrar(hospedagem);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(Exception));
            }

            Hospedagem hospedagemCadastrada = IHospedagem.ResultadoUnico(idHospedagem);
            Assert.IsNotNull(hospedagemCadastrada);
            Assert.IsInstanceOfType(hospedagemCadastrada, typeof(Hospedagem));
            Assert.AreEqual(hospedagem, hospedagemCadastrada);

            Quartos IQuarto = new Quartos();
            Quarto quarto = IQuarto.ResultadoUnico(idQuarto);
            Assert.IsNotNull(quarto);
            quarto.reservado = true;
            IQuarto.Atualizar(quarto);

            Quarto quartoAtualizado = IQuarto.ResultadoUnico(idQuarto);
            Assert.AreEqual(quarto, quartoAtualizado);

            ControleClientes IControleCliente = new ControleClientes();
            ControleCliente controleCliente = new ControleCliente();

            controleCliente.idCliente = 1;
            controleCliente.idHospedagem = idHospedagem;
            controleCliente.idPacoteHospedagem = idPacoteHospedagem;
            controleCliente.isResponsavel = true;
            controleCliente.dataCadastro = DateTime.Now;

            try
            {
                IControleCliente.Cadastrar(controleCliente);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(Exception));
            }
            //ControleCliente controleClienteCadastrado = IControleCliente.ResultadoUnico(i)


        }
    }
}
