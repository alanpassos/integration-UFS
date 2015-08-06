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
        public ActionResult Index()
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

                        clientes.Add( IPessoa.ResultadoUnico(Convert.ToInt32(c.idCliente)));
                        break;
                    }


                }


            }





            List<TipoQuarto> quartosLivres = ITipoQuartos.Listar().ToList<TipoQuarto>();
            

            ViewBag.Hospedagens = hospedagens;
            ViewBag.TipoQuartos = quartosLivres;
            ViewBag.Clientes = clientes;
            return View();
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