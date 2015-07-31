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

        public IQuartos IQuartos { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IPessoas IPessoa { get; set; }


        public ActionResult AdicionarItem()
        {
            


            return RedirectToAction("Cadastrar", "Item");
        }



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

                        clientes.Add( IPessoa.ResultadoUnico(c.idCliente));
                        break;
                    }


                }


            }





            List<Quarto> quartosLivres = IQuartos.Listar().ToList<Quarto>();
            

            ViewBag.Hospedagens = hospedagens;
            ViewBag.Quartos = quartosLivres;
            ViewBag.Clientes = clientes;
            return View();
        }
    }
}