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
    public class ReservaController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IPacoteHospedagens IPacoteHospedagens { get; set; }
        public ITipoQuartos ITipoQuarto { get; set; }

        // GET: Reserva
        public ActionResult Index()
        {
            List<PacoteHospedagem> pacoteHospedagens = IPacoteHospedagens.ListarReserva().ToList<PacoteHospedagem>();
            return View(pacoteHospedagens);
        }

        public ActionResult Detalhar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        public ActionResult Cadastrar()
        {
            List<TipoQuarto> tipoQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            ViewBag.tipoQuarto = tipoQuartos;
            return View();
            
        }

        [ActionName("CadastrarReserva")]
        public ActionResult Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "R";
            IPacoteHospedagens.Cadastrar(pacoteHospedagem);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("AtualizarReserva")]
        public ActionResult Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "R";
            IPacoteHospedagens.Atualizar(pacoteHospedagem);
            return RedirectToAction("Index");
        }

        public ActionResult Excluir(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("ExcluirReserva")]
        public ActionResult Excluir(PacoteHospedagem pacoteHospedagem)
        {
            IPacoteHospedagens.Remover(pacoteHospedagem);
            return RedirectToAction("Index");
        }
    }
}