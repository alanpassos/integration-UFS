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
        public IGerenciadorUsuarios IUsuarios { get; set; }
        public IGerenciadorPessoas IPessoas { get; set; }
        // GET: Usuario
        public ActionResult Index()
        {
            List<UsuarioModel> usuarios = IUsuarios.Listar().ToList<UsuarioModel>();
            return View(usuarios);
        }

        public ActionResult Cadastrar()
        {
            ViewBag.Funcionarios = IPessoas.ListarFuncionario().ToList<PessoaModel>();
            return View();
        }

        [ActionName("CadastrarUsuario")]
        public ActionResult Cadastrar(UsuarioModel usuario)
        {
            usuario.ativo = true;
            usuario.dataCadastro = DateTime.Now;
            usuario.nivelAcesso = Request.Params.Get("nivel");
            usuario.idFuncionario = Convert.ToInt32(Request.Params.Get("funcionario"));
            IUsuarios.Cadastrar(usuario);
            return RedirectToAction("Index");

        }


        public ActionResult Detalhar(int id)
        {
            UsuarioModel usuario = IUsuarios.ResultadoUnico(id);
            return View(usuario);
        }

        public ActionResult Editar(int id)
        {
            UsuarioModel usuario = IUsuarios.ResultadoUnico(id);
            return View(usuario);
        }

        [ActionName("EditarUsuario")]
        public ActionResult Editar(UsuarioModel usuario)
        {

            usuario.nivelAcesso = Request.Params.Get("nivel");
            IUsuarios.Atualizar(usuario);
            return RedirectToAction("Index");

        }

        public ActionResult Excluir(int id)
        {
            UsuarioModel usuario = IUsuarios.ResultadoUnico(id);
            return View(usuario);
        }

        [ActionName("ExcluirUsuario")]
        public ActionResult Excluir(UsuarioModel usuario)
        {
            IUsuarios.Remover(usuario);
            return RedirectToAction("Index");
        }


    }
}