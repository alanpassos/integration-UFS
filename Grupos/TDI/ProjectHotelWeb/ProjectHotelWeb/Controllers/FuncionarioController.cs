using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectHotelWeb.Controllers
{
    public class FuncionarioController : Controller
    {
        // GET: Funcionario
        public IProjectHotel IAcademic { get; set; }
        public IPessoas iFuncionarios { get; set; }
        public ICargos iCargos { get; set; }
        // GET: Pessoa
        public ActionResult Index()
        {

            List<Pessoa> funcionarios = iFuncionarios.ListarFuncionario().ToList<Pessoa>();
            List<Cargo> cargos = iCargos.Listar().ToList<Cargo>();

           



            return View(funcionarios);
        }

        public ActionResult Insert()
        {
            return View();
        }

        public ActionResult Create(Pessoa funcionario)
        {
            funcionario.dataCadastro = DateTime.Now;
            funcionario.ativo = true;
            funcionario.isFuncionario = true;

            iFuncionarios.Cadastrar(funcionario);
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id)
        {
            Pessoa funcionario = iFuncionarios.ResultadoUnicoFuncionario(id);
            funcionario.Cargo = iCargos.ResultadoUnico(funcionario.idCargo);
            return View(funcionario);
        }
        public ActionResult Edit(Pessoa funcionario)
        {
            iFuncionarios.Atualizar(funcionario);

            return RedirectToAction("Index");
        }

    }
}