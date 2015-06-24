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
        public ActionResult Index()
        {
            List<Cargo> car = cargos.Listar().ToList<Cargo>();
            return View(car);
        }
        public ActionResult Insert()
        {
         
            return View();
        }

        public ActionResult Create(Cargo cargo)
        {
            cargos.Cadastrar(cargo);
            return RedirectToAction("Index");
        }



    }
}