using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Infraestrutura.Repositorio;
using Dominio.Classes;

namespace ProjectHotelWebTest
{
    [TestClass]
    public class CargoTeste
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
            int idCargoModelExpected = 0;
            Cargos gCargo = new Cargos();
            Cargo cargoModelExpected = new Cargo();
            cargoModelExpected.descricao = "Atendente";
            cargoModelExpected.ativo = true;
            cargoModelExpected.observacao = "Atendente do hotel";
            try
            {
                idCargoModelExpected = gCargo.Cadastrar(cargoModelExpected);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(Exception));
            }
            Cargo cargoCadastrado = gCargo.ResultadoUnico(idCargoModelExpected);
            Assert.IsNotNull(cargoCadastrado);
            Assert.IsInstanceOfType(cargoCadastrado, typeof(Cargo));
            Assert.AreEqual(cargoModelExpected, cargoCadastrado);
            
        }
    }
}
