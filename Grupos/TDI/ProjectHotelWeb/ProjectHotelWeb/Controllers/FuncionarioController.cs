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

        public IPessoas iPessoas { get; set; }

        public ICargos iCargos { get; set; }
        // GET: Pessoa
        public ActionResult Index()
        {

            List<Pessoa> pessoas = iPessoas.ListarFuncionario().ToList<Pessoa>();
            List<Cargo> cargos = iCargos.Listar().ToList<Cargo>();

            return View(pessoas);
        }

        public ActionResult Insert()
        {
            return View();
        }



        public ActionResult Create(Pessoa pessoa)
        {

            pessoa.isFuncionario = true;
            pessoa.dataCadastro = DateTime.Now;
            pessoa.ativo = true;
            iPessoas.Cadastrar(pessoa);

            return RedirectToAction("Index");
        }
        public ActionResult Update(int id)
        {

            
            Pessoa pessoa = iPessoas.ResultadoUnicoFuncionario(id);
            ViewBag.Cargos = iCargos.Listar();
            return View(pessoa);
        }
        public ActionResult Edit(Pessoa pessoa)
        {
            
            pessoa.ativo =Convert.ToBoolean( Request.Params.Get("ativo"));
            pessoa.isFuncionario = Convert.ToBoolean(Request.Params.Get("funcionario"));
            iPessoas.Atualizar(pessoa);

            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            Pessoa pessoa = iPessoas.ResultadoUnicoFuncionario(id);
            if (pessoa != null)
            {
                pessoa.ativo = false;
                iPessoas.Atualizar(pessoa);
            }
            else
                return null;

            return RedirectToAction("Index");
        }

      

    }
}