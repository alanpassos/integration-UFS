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
    public class CargoController : Controller
    {

        public IProjectHotel iiprojetoHotel { get; set; }
        public ICargos cargos { get; set; }
        // GET: Cargo


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Index()
        {
            List<Cargo> car = cargos.Listar().ToList<Cargo>();
            return View(car);
        }

        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Insert()
        {
         
            return View();
        }


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Create(Cargo cargo)
        {
            cargos.Cadastrar(cargo);
            return RedirectToAction("Index");
        }



    }
}