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
        public IPessoas IPessoas { get; set; }
        // GET: Usuario
        public ActionResult Index()
        {
            List<Usuario> usuarios = IUsuarios.Listar().ToList<Usuario>();
            return View(usuarios);
        }

        public ActionResult Cadastrar()
        {
            ViewBag.Funcionarios = IPessoas.ListarFuncionario().ToList<Pessoa>();
            return View();
        }
         
        [ActionName("CadastrarUsuario")]
        public ActionResult Cadastrar(Usuario usuario)
        {
            usuario.ativo = true;
            usuario.dataCadastro = DateTime.Now;
            usuario.nivelAcesso = Request.Params.Get("nivel");
            usuario.idFuncionario = Convert.ToInt32 (Request.Params.Get("funcionario"));
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