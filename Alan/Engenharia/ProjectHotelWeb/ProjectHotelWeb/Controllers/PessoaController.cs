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
    public class PessoaController : Controller
    {
        public IProjectHotel IAcademic { get; set; }
        public IPessoas pessoas { get; set; }
        // GET: Pessoa
        public ActionResult Index()
        {
            List<Pessoa> pessoa = pessoas.Listar().ToList<Pessoa>();
            return View(pessoa);
        }
    }
}