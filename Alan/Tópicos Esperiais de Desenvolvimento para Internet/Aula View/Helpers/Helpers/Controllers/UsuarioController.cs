using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Helpers.Controllers
{
    public class UsuarioController : Controller
    {

        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult listar()
        {
            List<Usuario> usuarios = new List<Usuario>();
            usuarios.Add(new Usuario() { nome = "alan", email = "alanpassossi@gmail.com", senha = "901213", sexo = 'M' });
            return View(usuarios);

        }

        public ActionResult detalhe(Usuario usuario)
        {   
            return View(usuario);

        }
        public ActionResult editar(Usuario usuario)
        {
            return View(usuario);

        }
    }
}