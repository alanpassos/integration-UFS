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
    public class QuartoController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }

        public IQuartos IQuarto { get; set; }

        public ITipoQuartos ITipoQuarto { get; set; } 

        //Metodos da class 
        public ActionResult Index()
        {
            List<Quarto> quarto = IQuarto.Listar().ToList<Quarto>();
            return View(quarto);
        }

        public ActionResult Detalhar(int id)
        {
            Quarto quarto = IQuarto.ResultadoUnico(id);
            return View(quarto);
        }

        //Cadastrar
        public ActionResult Cadastrar()
        {

            List<TipoQuarto> tiposQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            ViewBag.Tipos = tiposQuartos;

            return View();
        }

        [ActionName("CadastrarQuarto")]
        public ActionResult Cadastrar(Quarto quarto)
        {
            quarto.ativo = true;
            quarto.idTipoQuarto = Convert.ToInt32(Request.Params.Get("Tipo"));
            quarto.status = Request.Params.Get("Status");

            IQuarto.Cadastrar(quarto);
            return RedirectToAction("Index");
        }

        //Atualizar
        public ActionResult Atualizar(int id)
        {
            Quarto quarto = IQuarto.ResultadoUnico(id);
            return View(quarto);
        }

        [ActionName("AtualizarQuarto")]
        public ActionResult Atualizar(Quarto quarto)
        {
            IQuarto.Atualizar(quarto);
            return RedirectToAction("Index");
        }

        //Excluir
        public ActionResult Excluir(int id)
        {
            Quarto quarto = IQuarto.ResultadoUnico(id);
            return View(quarto);
        }

        [ActionName("ExcluirQuarto")]
        public ActionResult Excluir(Quarto quarto)
        {
            quarto.ativo = false;
            IQuarto.Atualizar(quarto);

            return RedirectToAction("Index");
        }

    }
}