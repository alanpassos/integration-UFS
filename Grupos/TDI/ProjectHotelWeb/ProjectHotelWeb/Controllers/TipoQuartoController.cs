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
    public class TipoQuartoController : Controller
    {

        public IProjectHotel IAcademic { get; set; }
        public ITipoQuartos ITipoQuarto { get; set; }

        // GET: TipoQuarto
        public ActionResult Index()
        {
            List<TipoQuarto> tipoQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            return View(tipoQuartos);
        }

        public ActionResult Detalhar(int id)
        {
            TipoQuarto tipoQuarto = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuarto);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarTipoQuarto")]
        public ActionResult Cadastrar(TipoQuarto tipoQuarto)
        {
            ITipoQuarto.Cadastrar(tipoQuarto);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(int id)
        {
            TipoQuarto tipoQuartos = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuartos);
        }

        [ActionName("AtualizarTipoQuarto")]
        public ActionResult Atualizar(TipoQuarto tipoQuarto)
        {
            ITipoQuarto.Atualizar(tipoQuarto);
            return RedirectToAction("Index");
        }

        public ActionResult Excluir(int id)
        {
            TipoQuarto tipoQuarto = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuarto);
        }

        [ActionName("ExcluirTipoQuarto")]
        public ActionResult Excluir(TipoQuarto tipoQuarto)
        {
            ITipoQuarto.Remover(tipoQuarto);
            return RedirectToAction("Index");
        }
        /*
        public ActionResult Listar()
        {
            return Json(new
            {
                ITipoQuarto = ITipoQuarto.Listar().ToList(),
            });
        }
        */
    }
}