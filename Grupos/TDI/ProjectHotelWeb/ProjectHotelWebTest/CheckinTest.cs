using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Dominio.Classes;
using Infraestrutura.Repositorio;

namespace ProjectHotelWebTest
{


    [TestClass]
    public class CheckinTest
    {
        private TestContext testContextInstance;
        PacoteHospedagem pacote;
        Quarto quarto;
        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestInitialize]
        public void ObtemPacote()
        {
            Quartos IQuarto = new Quartos();
            
            quarto = new Quarto();
            quarto = IQuarto.ResultadoUnico(1);

            if (quarto.status.Equals("L"))
            {
                PacoteHospedagens IPacote = new PacoteHospedagens();
                 
                pacote = new PacoteHospedagem();
                pacote.valorTotal = 0;
                pacote.subTotal = 0;
                pacote.dataCadastro = DateTime.Now;
                pacote.ativo = true;
                pacote.tipoPacote = "C";
                pacote.idPacoteHospedagem = IPacote.Cadastrar(pacote);
            }


        }



        [TestMethod]
        public void RealizarCheckin()
        {
            if (quarto.status.Equals("L"))
            {
            PacoteHospedagens IPacote = new PacoteHospedagens();
            Hospedagens IHospedagens = new Hospedagens();
            ControleClientes IControleCliente = new ControleClientes();
            Quartos IQuartos = new Quartos();
            Hospedagem hospedagem = new Hospedagem();
            ControleCliente controleCliente = new ControleCliente();
            Pessoas IPessoas = new Pessoas();
            hospedagem.idPacoteHospedagem = pacote.idPacoteHospedagem;
            hospedagem.idQuarto = quarto.idQuarto;
            hospedagem.dataAbertura = DateTime.Now;
            hospedagem.dataLiberacao = hospedagem.dataAbertura.AddDays(5);
            hospedagem.valorHospedagem = quarto.TipoQuarto.valor * 5;
            hospedagem.aberto = true;
           
          
                try
                {
                    hospedagem.idHospedagem = IHospedagens.Cadastrar(hospedagem);
                }
                catch (Exception e)
                {
                    Assert.IsInstanceOfType(e, typeof(Exception));

                }


                Hospedagem hospedagemCadastrado = IHospedagens.ResultadoUnico(hospedagem.idHospedagem);
                Assert.IsNotNull(hospedagemCadastrado);
                Assert.IsInstanceOfType(hospedagemCadastrado, typeof(Hospedagem));
                Assert.AreEqual(hospedagem, hospedagemCadastrado);

                controleCliente.idHospedagem = hospedagem.idHospedagem;
                controleCliente.idPacoteHospedagem = pacote.idPacoteHospedagem;
                controleCliente.idCliente = IPessoas.ResultadoUnico(1).idPessoa;
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
                ControleCliente newControleCliente = IControleCliente.ResultadoUnico(controleCliente.idCliente,controleCliente.idHospedagem);
                Assert.IsNotNull(newControleCliente);
                Assert.IsInstanceOfType(newControleCliente, typeof(ControleCliente));
                Assert.AreEqual(controleCliente, newControleCliente);


                quarto.status = "O";
                
                try
                {
                    IQuartos.Atualizar(quarto);
                }
                catch (Exception e)
                {
                    Assert.IsInstanceOfType(e, typeof(Exception));

                }


                Quarto QuartoAtual = IQuartos.ResultadoUnico(quarto.idQuarto);
                Assert.AreEqual(QuartoAtual, quarto);

                pacote.valorTotal = pacote.subTotal = hospedagem.valorHospedagem;
                try
                {
                    IPacote.Atualizar(pacote);
                }
                catch (Exception e)
                {
                    Assert.IsInstanceOfType(e, typeof(Exception));

                }
               
                PacoteHospedagem pacoteHospedagem = IPacote.ResultadoUnico(pacote.idPacoteHospedagem);
                Assert.IsNotNull(pacoteHospedagem);
                Assert.IsInstanceOfType(pacoteHospedagem, typeof(PacoteHospedagem));
                Assert.AreEqual(pacote, pacoteHospedagem);

            }
           

        }
    }
}
