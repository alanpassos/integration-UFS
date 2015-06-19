using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Exercicio3.Controllers
{
    public class ContatoController : Controller
    {
        // GET: Contato
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult enviar(Contato contato)
        {
            ViewData["Numero"] = contato.numero;
            ViewData["Contato"] = contato.contato;
            return View();

        }

    }
}