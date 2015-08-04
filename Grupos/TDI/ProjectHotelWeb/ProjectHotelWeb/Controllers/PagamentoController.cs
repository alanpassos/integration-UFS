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
    public class PagamentoController : Controller
    {

        public IProjectHotel IProjectHotel { get; set; }
        public IPagamentos IPagamento { get; set; } 

        // GET: Pagamento
        public ActionResult Index()
        {
            List<Pagamento> pagamento = IPagamento.Listar().ToList<Pagamento>();
            return View(pagamento);
        }

        //Detalhar 
        public ActionResult Detalhar(int id)
        {
            Pagamento pagamento = IPagamento.ResultadoUnico(id);
            return View(pagamento); 
        }

        //Cadastrar
        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarPagamento")]
        public ActionResult Cadastrar(Pagamento pagamento)
        {
            IPagamento.Cadastrar(pagamento);
            return RedirectToAction("Index");
        }

        //Atualizar 
        public ActionResult Atualizar(int id)
        {
            Pagamento pagamento = IPagamento.ResultadoUnico(id);
            return View(pagamento);
        }

        [ActionName("AtualizarPagamento")]
        public ActionResult Atualizar(Pagamento pagamento)
        {
            IPagamento.Atualizar(pagamento);
            return RedirectToAction("Index");
        }

        //Excluir
        public ActionResult Excluir(int id){
            Pagamento pagamento = IPagamento.ResultadoUnico(id);
            return View(pagamento);
        }

        [ActionName("ExcluirPagamento")]
        public ActionResult Excluir(Pagamento pagamento)
        {
            IPagamento.Remover(pagamento);
            return RedirectToAction("Index");
        }
    }
}