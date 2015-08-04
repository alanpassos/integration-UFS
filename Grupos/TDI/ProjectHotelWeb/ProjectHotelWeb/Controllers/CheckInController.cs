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
    public class CheckInController : Controller
    {
        List<Pessoa> pessoasAdicionadas = new List<Pessoa>();
        public IProjectHotel IProjectHotel { get; set; }
        public IPacoteHospedagens IPacoteHospedagens { get; set; }
        public IPessoas IPessoas { get; set; }




        // GET: CheckIn
        public ActionResult Index()
        {
            List<PacoteHospedagem> pacoteHospedagens = IPacoteHospedagens.ListarCheckin().ToList<PacoteHospedagem>();
            return View(pacoteHospedagens);
        }

        public ActionResult Detalhar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoCheckin(id);
            return View(pacoteHospedagem);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarCheckin")]
        public ActionResult Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "C";
            IPacoteHospedagens.Cadastrar(pacoteHospedagem);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoCheckin(id);
            return View(pacoteHospedagem);
        }

        [ActionName("AtualizarCheckin")]
        public ActionResult Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "C";
            IPacoteHospedagens.Atualizar(pacoteHospedagem);
            return RedirectToAction("Index");
        }
        public ActionResult Checkin()
        {


            return View();
        }


        public ActionResult AtualizarCliente()
        {
            string cpfMask = Request.Params.Get("Consulta");
            adicionarPessoas(cpfMask);
            ViewBag.Pessoas = pessoasAdicionadas;
            return View("Checkin");
        }

        private void adicionarPessoas(string cpfMask)
        {
            string cpf = cpfMask.Replace(".", "").Replace("-", "");

            List<Pessoa> pessoas = IPessoas.ListarPorCpfCnpj(cpf).ToList<Pessoa>();

            if (ViewBag.Pessoas != null)
            {
                pessoasAdicionadas.AddRange(ViewBag.Pessoas);
            }
            foreach (var pessoa in pessoas)
            {

                pessoasAdicionadas.Add(pessoa);

            }



        }
    }
}