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
    public class ProdutoController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IProdutos IProduto { get; set; }

        // GET: Produto
        public ActionResult Index()
        {
            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            return View(produtos);
        }

        public ActionResult Detalhar(int id)
        {
            Produto produto = IProduto.ResultadoUnico(id);
            return View(produto);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarProduto")]
        public ActionResult Cadastrar(Produto produto)
        {
            IProduto.Cadastrar(produto);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(int id)
        {
            Produto produtos = IProduto.ResultadoUnico(id);
            return View(produtos);
        }

        [ActionName("AtualizarProduto")]
        public ActionResult Atualizar(Produto produto)
        {
            IProduto.Atualizar(produto);
            return RedirectToAction("Index");
        }

        public ActionResult Excluir(int id)
        {
            Produto produto = IProduto.ResultadoUnico(id);
            return View(produto);
        }

        [ActionName("ExcluirProduto")]
        public ActionResult Excluir(Produto produto)
        {
            IProduto.Remover(produto);
            return RedirectToAction("Index");
        }
    }
}