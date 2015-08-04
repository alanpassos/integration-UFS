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
            string consulta = Request.Params.Get("Consulta");
            string filtro = Request.Params.Get("Filtro");
            adicionarPessoas(consulta, filtro);
            ViewBag.Pessoas = pessoasAdicionadas;
            return View("Checkin");
        }




        /// <summary>
        /// Adiciona as pessoas que estão cadastrardas no sistema
        /// </summary>
        /// <param name="consulta">Valor no text para a consulta</param>
        /// <param name="filtro">Combo relacionado ao tipo de dados para a consulta</param>
        private void adicionarPessoas(string consulta, string filtro)
        {
            List<Pessoa> pessoas = FiltroConsulta(consulta, filtro);

            if (ViewBag.Pessoas != null)
            {
                pessoasAdicionadas.AddRange(ViewBag.Pessoas);
            }
            foreach (var pessoa in pessoas)
            {

                pessoasAdicionadas.Add(pessoa);

            }
        }
        /// <summary>
        /// Filtro da consulta para o retorno das pessoas selecionadas
        /// </summary>
        /// <param name="consulta">Valores para o campo de consulta</param>
        /// <param name="filtro">Cpf, Cnpj, Telefone ou Nome</param>
        /// <returns></returns>
        private List<Pessoa> FiltroConsulta(string consulta, string filtro)
        {
            List<Pessoa> pessoas = new List<Pessoa>();
            switch (Convert.ToInt32(filtro))
            {

                case 1:
                    string cpf = consulta.Replace(".", "").Replace("-", "");
                    pessoas = IPessoas.ListarPorCpfCnpj(cpf).ToList<Pessoa>();
                    break;
                case 2:
                    string cnpj = consulta.Replace(".", "").Replace("-", "").Replace("/", "");
                    pessoas = IPessoas.ListarPorCpfCnpj(cnpj).ToList<Pessoa>();
                    break;
                case 3:
                    string nome = consulta;
                    pessoas = IPessoas.ListarPorNome(nome).ToList<Pessoa>();
                    break;
                case 4:
                    string telefone = consulta.Replace("(", "").Replace(")", "").Replace("-", "");
                    pessoas = IPessoas.ListarPorNome(telefone).ToList<Pessoa>();
                    break;

            }
            return pessoas;
        }
    }
}