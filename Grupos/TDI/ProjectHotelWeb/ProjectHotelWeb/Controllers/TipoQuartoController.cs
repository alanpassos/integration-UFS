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

        public IProjectHotel IProjectHotel { get; set; }
        public ITipoQuartos ITipoQuarto { get; set; }

        // GET: TipoQuarto

        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Index()
        {
            List<TipoQuarto> tipoQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            return View(tipoQuartos);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Detalhar(int id)
        {
            TipoQuarto tipoQuarto = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuarto);
        }


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarTipoQuarto")]

        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Cadastrar(TipoQuarto tipoQuarto)
        {
            ITipoQuarto.Cadastrar(tipoQuarto);
            return RedirectToAction("Index");
        }


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Atualizar(int id)
        {
            TipoQuarto tipoQuartos = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuartos);
        }

        [ActionName("AtualizarTipoQuarto")]
        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Atualizar(TipoQuarto tipoQuarto)
        {
            ITipoQuarto.Atualizar(tipoQuarto);
            return RedirectToAction("Index");
        }


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Excluir(int id)
        {
            TipoQuarto tipoQuarto = ITipoQuarto.ResultadoUnico(id);
            return View(tipoQuarto);
        }

        [ActionName("ExcluirTipoQuarto")]
        [Authorize(Roles = "Administrador, Gerente")]
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