using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace View.Controllers
{
    public class ContatoController : Controller
    {
        // GET: Contato
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DadosContato()
        {
            List<Contato> contatos = new List<Contato> { 
                new Contato() { celular = "09123123", telefone = "12312312", email = "alanpassossi@gmail.com" }, 
                new Contato() { celular = "09123133", telefone = "12312091", email = "iurybas@gmail.com" }, 
                new Contato() { celular = "09129283", telefone = "16372312", email = "brendelsantos@gmail.com" } 
            };
            
            return View(contatos);
        }


    }
}