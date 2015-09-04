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

        #region Atributos
        Cargos gCargo = new Cargos();
        Cargo cargoModelExpected;
        #endregion



        [TestMethod]
        public void CadastrarCargoValidoTest()
        {
            cargoModelExpected = new Cargo();


            cargoModelExpected.descricao = "Atendente";
            cargoModelExpected.ativo = false;
            cargoModelExpected.observacao = "Atendente do hotel";

            cargoModelExpected.idCargo = gCargo.Cadastrar(cargoModelExpected);
        }

        [TestMethod]
        public void AtualizarCargoValidoTest()
        {   cargoModelExpected = new Cargo();
            cargoModelExpected = gCargo.ResultadoUnico(1);
            cargoModelExpected.descricao = "Cargo de testes";
            gCargo.Atualizar(cargoModelExpected);
        }
    }
}
