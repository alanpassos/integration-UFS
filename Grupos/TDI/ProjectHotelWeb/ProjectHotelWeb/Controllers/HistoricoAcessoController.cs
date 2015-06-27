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
    public class HistoricoAcessoController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IHistoricoAcessos IHistoricoAcessos { get; set; }


        // GET: HistoricoAcesso
        public ActionResult Index()
        {
            List<HistoricoAcesso> historicoAcesso = IHistoricoAcessos.Listar().ToList<HistoricoAcesso>();
            return View(historicoAcesso);
        }
    }
}