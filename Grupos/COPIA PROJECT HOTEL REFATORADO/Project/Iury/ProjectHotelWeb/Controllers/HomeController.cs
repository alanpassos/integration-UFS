using Dominio.Classes;
using Dominio.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWeb.Controllers
{
    public class HomeController : Controller
    {

        public ITipoQuartos ITipoQuartos { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IPessoas IPessoa { get; set; }






        // GET: Home
        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Index(string filtro)

        {
         
            switch (filtro)
            {
                case "L":
                    ListarLivres();
                    break;
                case "O":
                    ListarOcupados();
                    break;
                default:
                    ListarLivres();
                    ListarOcupados();
                    break;
            }

            return View();
        }

        private void ListarLivres()
        {
            List<TipoQuartoModel> quartosLivres = ITipoQuartos.Listar().ToList<TipoQuartoModel>();
            ViewBag.TipoQuartos = quartosLivres;
        }

        private void ListarOcupados()
        {
            List<HospedagemModel> hospedagens = IHospedagem.Listar().ToList<HospedagemModel>();
            List<QuartoModel> quartos = new List<QuartoModel>();
            List<PessoaModel> clientes = new List<PessoaModel>();
            foreach (var h in hospedagens)
            {
                foreach (var c in h.ControleCliente)
                {
                    if (c.isResponsavel)
                    {
                        clientes.Add(IPessoa.ResultadoUnico(Convert.ToInt32(c.idCliente)));
                        break;
                    }

                }

            }
            ViewBag.Hospedagens = hospedagens;
            ViewBag.Clientes = clientes;
        }

        public ActionResult QuartosLivres()
        {
            List<TipoQuartoModel> quartosLivres = ITipoQuartos.Listar().ToList<TipoQuartoModel>();
            ViewBag.Hospedagens = null;
            ViewBag.Quartos = quartosLivres;

            return View();
        }
    }
}
