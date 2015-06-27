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
        public IFuncionarios iFuncionarios { get; set; }
        
        public ICargos iCargos { get; set; }
        // GET: Pessoa
        public ActionResult Index()
        {

            List<Funcionario> funcionarios = iFuncionarios.Listar().ToList<Funcionario>();
            List<Cargo> cargos = iCargos.Listar().ToList<Cargo>();

            return View(funcionarios);
        }

        public ActionResult Insert()
        {
            return View();
        }

        public ActionResult Create(Funcionario funcionario)
        {
            funcionario.dataCadastro = DateTime.Now;
            funcionario.ativo = true;
            funcionario.isFuncionario = true;

            iFuncionarios.Cadastrar(funcionario);
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id)
        {
            Funcionario funcionario = iFuncionarios.ResultadoUnico(id);
            funcionario.Cargo = iCargos.ResultadoUnico(funcionario.idCargo);
            return View(funcionario);
        }
        public ActionResult Edit(Funcionario funcionario)
        {
            iFuncionarios.Atualizar(funcionario);

            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            Funcionario funcionario = iFuncionarios.ResultadoUnico(id);

            return View(funcionario);
        }

        public ActionResult Excluir(Funcionario funcionario)
        {
            funcionario.ativo = false;
            iFuncionarios.Atualizar(funcionario);

            return RedirectToAction("Index");
        }


    }
}