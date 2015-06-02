using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelWeb.Dominio.Classes;
using HotelWeb.Dominio.Interfaces;
using HotelWeb.Infraestrutura.Database;

namespace HotelWeb.Controllers
{
    public class PessoaController : Controller
    {
        public IExemplo IExemplo { get; set; }
        public IPessoas pessoas { get; set; }

        // GET: Pessoa
        public ActionResult Index()
        {
            List<Pessoa> pessoa = pessoas.Listar().ToList<Pessoa>();
            return View(pessoa);
        }
        public ActionResult Inserir()
        {
            return View();
        }

        public ActionResult Inserir3()
        {
            return View();
        }
        public ActionResult Inserir2()
        {
            return View();
        }

        // GET: Usuario/Details/5
        public ActionResult Detalhar(int id)
        {
            Pessoa pessoa = pessoas.ResultadoUnico(id);
            return View(pessoa);
        }

        public ActionResult Editar(int id)
        {
            Pessoa pessoa = pessoas.ResultadoUnico(id);
            return View(pessoa);
        }

        public ActionResult Cadastrar(Pessoa pessoa)
        {
            pessoas.Cadastrar(pessoa);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(Pessoa pessoa)
        {
            pessoas.Atualizar(pessoa);
            return RedirectToAction("Index");
        }

        public ActionResult Remover(int id)
        {
            Pessoa pessoa = pessoas.ResultadoUnico(id);
            return View(pessoa);
        }

        [ActionName("Excluir")]
        public ActionResult Remover(Pessoa pessoa)
        {
            pessoas.Remover(pessoa);
            return RedirectToAction("Index");
        }

        public ActionResult Listar()
        {
            return Json(new
            {
                usuarios = pessoas.Listar().ToList(),
            });
        }
    }
}