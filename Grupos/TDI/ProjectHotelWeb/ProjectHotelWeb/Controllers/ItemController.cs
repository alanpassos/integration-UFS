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
    public class ItemController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IItens IItem { get; set; }

        // GET: Item
        public ActionResult Index()
        {
            List<Item> itens = IItem.Listar().ToList<Item>();
            return View(itens);
        }
    }
}