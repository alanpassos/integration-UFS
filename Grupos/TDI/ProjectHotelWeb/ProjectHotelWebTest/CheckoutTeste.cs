using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class CheckoutTeste
    {

        private TestContext testContextInstance;
        private PacoteHospedagens gPacoteHospedagem { get; set; }
        private PacoteHospedagem pacoteHospedagem { get; set; }
        private Quartos gQuartos { get; set; }
        private Quarto quarto { get; set; }
        private Hospedagens gHospedagens { get; set; }
        private Hospedagem hospedagem { get; set; }

        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestInitialize]
        public void ObtemPacoteHospedagem()
        {
            PacoteHospedagens gPacoteHospedagem = new PacoteHospedagens();
            Quartos gQuartos = new Quartos();

            this.gPacoteHospedagem = gPacoteHospedagem;
            PacoteHospedagem pacoteHospedagem = gPacoteHospedagem.ResultadoUnicoCheckin(1);
            
            this.pacoteHospedagem = pacoteHospedagem;
            
        }

        [TestMethod]
        public void Checkout()
        {
            
        }
    }
}
