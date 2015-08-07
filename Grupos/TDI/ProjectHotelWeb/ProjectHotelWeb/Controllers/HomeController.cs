using Dominio.Classes;
using Dominio.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectHotelWeb.Controllers
{
    public class HomeController : Controller
    {

        public ITipoQuartos ITipoQuartos { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IPessoas IPessoa { get; set; }






        // GET: Home
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
            List<TipoQuarto> quartosLivres = ITipoQuartos.Listar().ToList<TipoQuarto>();
            ViewBag.TipoQuartos = quartosLivres;
        }

        private void ListarOcupados()
        {
            List<Hospedagem> hospedagens = IHospedagem.Listar().ToList<Hospedagem>();
            List<Quarto> quartos = new List<Quarto>();
            List<Pessoa> clientes = new List<Pessoa>();
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
            List<TipoQuarto> quartosLivres = ITipoQuartos.Listar().ToList<TipoQuarto>();
            ViewBag.Hospedagens = null;
            ViewBag.Quartos = quartosLivres;
            return View();
        }
    }
}