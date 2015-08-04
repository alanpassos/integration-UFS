using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infraestrutura.Repositorio;
using Dominio.Interfaces;
using Dominio.Classes;


namespace ProjectHotelWeb.Controllers
{
    public class ServicoController : Controller
    {

        public IServicos IServicos { get; set; }


        // GET: Servico
        public ActionResult Index()
        {
            List<Servico> servicos = IServicos.Listar().ToList<Servico>();

            return View(servicos);
        }

        public ActionResult Cadastrar()
        {

            return View();
        }

        public ActionResult CadastrarServico(Servico servico)
        {

            servico.observacao = Request.Params.Get("Observacao");
            servico.ativo = true;
            IServicos.Cadastrar(servico);
            return RedirectToAction("Index");
        }


        public ActionResult Atualizar(int id)
        {

            Servico servico = IServicos.ResultadoUnico(id);


            return View(servico);
        }

        public ActionResult AtualizarServico(Servico servico)
        {

            servico.observacao = Request.Params.Get("Observacao");
            IServicos.Atualizar(servico);
            return RedirectToAction("Index");
        }
        public ActionResult Detalhar(int id)
        {
            Servico servico = IServicos.ResultadoUnico(id);

            return View(servico);
        }
    }
}