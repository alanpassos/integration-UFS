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
    public class UsuarioController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IUsuarios IUsuarios { get; set; }
        // GET: Usuario
        public ActionResult Index()
        {
            List<Usuario> usuarios = IUsuarios.Listar().ToList<Usuario>();
            return View(usuarios);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }
         
        [ActionName("CadastrarUsuario")]
        public ActionResult Cadastrar(Usuario usuario)
        {
            usuario.ativo = true;
            usuario.dataCadastro = DateTime.Now;
            usuario.nivelAcesso = Request.Params.Get("nivel");
            IUsuarios.Cadastrar(usuario);
            return RedirectToAction("Index");

        }

        public ActionResult Detalhar(int id)
        {
            Usuario usuario = IUsuarios.ResultadoUnico(id);
            return View(usuario);
        }

        public ActionResult Editar(Usuario usuario)
        {
            IUsuarios.Atualizar(usuario);
            return RedirectToAction("index");

        }


    }
}