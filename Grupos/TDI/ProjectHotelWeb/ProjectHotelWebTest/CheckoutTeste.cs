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
        private PacoteHospedagem pacoteHospedagem { get; set; }

        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestInitialize]
        public void ObtemPacoteHospedagem()
        {
            PacoteHospedagens gPacoteHospedagem = new PacoteHospedagens();
            PacoteHospedagem pacoteHospedam = gPacoteHospedagem.ResultadoUnico(1);
            this.pacoteHospedagem = pacoteHospedagem;
        }

        [TestMethod]
        public void Checkout()
        {
            
        }
    }
}
