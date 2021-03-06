﻿using Dominio.Classes;
using Dominio.Interfaces;
using Dominio.Classes_Especiais;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Globalization;
namespace ProjectHotelWeb.Controllers
{
    public class ReservaController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IPacoteHospedagens IPacoteHospedagem { get; set; }
        public ITipoQuartos ITipoQuarto { get; set; }
        public IPessoas IPessoas { get; set; }
        public IControleClientes IControleCliente { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IQuartos IQuarto { get; set; }

        // GET: Reserva

        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Index()
        {
            List<PacoteHospedagem> pacoteHospedagens = IPacoteHospedagem.ListarReserva().ToList<PacoteHospedagem>();
            return View(pacoteHospedagens);
        }

        public ActionResult ConsultaReservaParametro()
        {
            string pesquisa = Request.Params.Get("pesquisa");

            string parametroPesquisa = Request.Params.Get("parametroPesquisa");
            List<PacoteHospedagem> pacoteHospedagens = null;
            pesquisa = pesquisa.Replace(".", "").Replace("-", "");
            if (parametroPesquisa.Equals("nome"))
                pacoteHospedagens = IPacoteHospedagem.ListarReservaPorCliente(pesquisa).ToList<PacoteHospedagem>();
            if (parametroPesquisa.Equals("cpf"))
                pacoteHospedagens = IPacoteHospedagem.ListarReservaPorCpf(pesquisa).ToList<PacoteHospedagem>();
            if (parametroPesquisa.Equals("dataInicio"))
                pacoteHospedagens = IPacoteHospedagem.ListarReservaPorDataInicio(pesquisa).ToList<PacoteHospedagem>();
            if (parametroPesquisa.Equals("dataFim"))
                pacoteHospedagens = IPacoteHospedagem.ListarReservaPorDataFim(pesquisa).ToList<PacoteHospedagem>();
            return PartialView(pacoteHospedagens);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Detalhar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagem.ResultadoUnicoReserva(id);
            List<QuartosLivresReserva> reservasCliente = IPacoteHospedagem.ListaTiposReservadosPacote(id).ToList();
            ViewBag.reservasPacote = reservasCliente;
            return View(pacoteHospedagem);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult Cadastrar()
        {
            List<TipoQuarto> tipoQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            ViewBag.tipoQuarto = tipoQuartos;

            if (TempData["quartos"] != null)
            {
                ViewBag.quartosLivres = (List<QuartosLivresReserva>)TempData["quartos"];
                ViewBag.dataInicioFim = (List<DateTime>)TempData["datas"];
            }

            if (TempData["dadosView"] != null)
            {
                int idPacoteHospedagem = Convert.ToInt32(TempData["idPacote"]);
                List<object> objetosCliente = (List<object>)TempData["dadosView"];
                ViewBag.dadosView = objetosCliente;
                //    ViewBag.listaReservaCliente = ITipoQuarto.ListaTiposReservadosCliente(Convert.ToInt32(objetosCliente[3]));
                ViewBag.idPacoteHospedagem = idPacoteHospedagem;

            }

            return View();

        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult ReservaCliente(PacoteHospedagem _pacoteHospedagem)
        {
            string cpf = Request.Params.Get("cpf");
            string nomeCliente = Request.Params.Get("nome");
            string telefone = Request.Params.Get("telefone");
            string idPacote = Request.Params.Get("idPacote");
            List<object> dadosView = new List<object>();
            dadosView.Add(cpf);
            dadosView.Add(nomeCliente);
            dadosView.Add(telefone);
            cpf = cpf.Replace(".", "").Replace("-", "");
            CultureInfo culture = new CultureInfo("pt-BR");
            DateTime dataInicio = Convert.ToDateTime(Request.Params.Get("dataInicio"));
            DateTime dataFim = Convert.ToDateTime(Request.Params.Get("dataFim"));
            int idPacoteHospedagem = 0;
            if (TempData["idPacote"] == null)
            {
                idPacoteHospedagem = CadastraPacoteHospedagem(dataInicio, dataFim);
            }
            else
            {
                idPacoteHospedagem = Convert.ToInt32(TempData["idPacote"]);
            }
            List<int> idsQuartos;
            string[] comboBoxQuantidadeQuartos = Request.Params.Get("quantidade").Split(',', ' ');
            string[] checkBoxQuartosSelecionados = Request.Params.Get("checkQuartos").Split(',', ' ');
            List<Pessoa> pessoaResultado = IPessoas.ListarPorCpfCnpj(cpf).ToList();
            int idCliente;
            if (pessoaResultado.Count == 0)
            {
                CadastraCliente(cpf, nomeCliente, telefone);
            }
            idCliente = IPessoas.ListarPorCpfCnpj(cpf).ToList()[0].idPessoa;
            dadosView.Add(idCliente);

            double periodo = (dataFim - dataInicio).TotalDays;
            for (int i = 0; i < checkBoxQuartosSelecionados.Count(); i += 2)
            {
                string idTipoQuartoCheck = checkBoxQuartosSelecionados[i];
                string capacidadeQuarto = checkBoxQuartosSelecionados[i + 1];
                idsQuartos = ITipoQuarto.ListaQuartosTipo(idTipoQuartoCheck, capacidadeQuarto).ToList();
                for (int j = 0; j < comboBoxQuantidadeQuartos.Count(); j += 2)
                {
                    string idTipoQuartoCombo = comboBoxQuantidadeQuartos[j];
                    if (idTipoQuartoCheck.Equals(idTipoQuartoCombo))
                    {
                        int indiceQuarto = 0;
                        string quantidadeQuatosSelecionada = comboBoxQuantidadeQuartos[j + 1];
                        for (int k = 0; k < Convert.ToInt32(quantidadeQuatosSelecionada); k++)
                        {
                            TipoQuarto tipoQuarto = ITipoQuarto.ResultadoUnico(Convert.ToInt32(idTipoQuartoCombo));
                            decimal valorHospedagem = tipoQuarto.valor * Convert.ToDecimal(periodo);
                            PacoteHospedagem pacoteHospedagem = IPacoteHospedagem.ResultadoUnico(idPacoteHospedagem);
                            pacoteHospedagem.valorTotal = pacoteHospedagem.valorTotal + valorHospedagem;
                            pacoteHospedagem.subTotal = pacoteHospedagem.valorTotal;
                            IPacoteHospedagem.Atualizar(pacoteHospedagem);
                            int idHospedagem = CadastraHospedagem(dataInicio, dataFim, idsQuartos, valorHospedagem, idPacoteHospedagem, indiceQuarto);
                            AtualizaQuartoReservado(idsQuartos[indiceQuarto]);
                            indiceQuarto++;
                            CadastraControleCliente(idCliente, idPacoteHospedagem, idHospedagem);
                        }
                    }
                }
            }
            TempData["idPacote"] = idPacoteHospedagem;
            TempData["dadosView"] = dadosView;
            List<QuartosLivresReserva> reservasCliente = IPacoteHospedagem.ListaTiposReservadosPacote(idPacoteHospedagem).ToList();
            return PartialView(reservasCliente);
        }

        private void AtualizaQuartoReservado(int indiceQuarto)
        {
            Quarto quarto = IQuarto.ResultadoUnico(indiceQuarto);
            quarto.reservado = true;
            IQuarto.Atualizar(quarto);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        private int CadastraHospedagem(DateTime dataInicio, DateTime dataFim, List<int> idsQuartos, decimal valorHospedagem, int idPacoteHospedagem, int indiceQuarto)
        {
            int idHospedagem = IHospedagem.Cadastrar(
            new Hospedagem()
            {
                aberto = true,
                idPacoteHospedagem = idPacoteHospedagem,
                dataAbertura = dataInicio,
                dataLiberacao = dataFim,
                idQuarto = idsQuartos[indiceQuarto],
                valorHospedagem = valorHospedagem
            });
            return idHospedagem;
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        private void CadastraControleCliente(int idCliente, int idPacoteHospedagem, int idHospedagem)
        {
            ControleCliente controle = new ControleCliente()
            {
                idCliente = idCliente,
                idHospedagem = idHospedagem,
                idPacoteHospedagem = idPacoteHospedagem,
                isResponsavel = true,
                dataCadastro = DateTime.Now
            };
            IControleCliente.Cadastrar(controle);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        private void CadastraCliente(string cpf, string nome, string telefone)
        {
            Pessoa cliente;
            cliente = new Pessoa();
            cliente.cpfCnpj = cpf;
            cliente.nome = nome;
            cliente.telefoneMovel = telefone;
            cliente.ativo = true;
            cliente.isFuncionario = false;
            cliente.dataCadastro = DateTime.Now;
            cliente.estado = "";
            IPessoas.Cadastrar(cliente);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        private int CadastraPacoteHospedagem(DateTime dataInicio, DateTime dataFim)
        {
            int idPacoteHospedagem = IPacoteHospedagem.Cadastrar(
                new PacoteHospedagem()
                {
                    dataCadastro = DateTime.Now,
                    tipoPacote = "R",
                    ativo = true,
                    dataLiberacao = DateTime.Now,
                    dataEntrada = dataInicio,
                    dataSaida = dataFim,
                    subTotal = 0,
                    valorTotal = 0
                });
            return idPacoteHospedagem;
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Consultar()
        {

            CultureInfo culture = new CultureInfo("pt-BR");

            DateTime dataInicio = Convert.ToDateTime(Request.Params.Get("dataInicio"), culture);
            DateTime dataFim = Convert.ToDateTime(Request.Params.Get("dataFim"), culture);
            string tipoQuarto = Request.Params.Get("tipoQuarto");
            string numeroPessoas = Request.Params.Get("pessoas");
            string numeroQuartos = Request.Params.Get("quartos");

            List<QuartosLivresReserva> quartosLivresReserva = IPacoteHospedagem.ListaLivres(tipoQuarto, numeroPessoas, dataInicio, dataFim).ToList<QuartosLivresReserva>();
            List<DateTime> dataInicioFim = new List<DateTime>();
            dataInicioFim.Add(dataInicio);
            dataInicioFim.Add(dataFim);
            List<object> dadosView = new List<object>();

            TempData["quartos"] = quartosLivresReserva;
            TempData["datas"] = dataInicioFim;

            ViewBag.dataInicioFim = dataInicioFim;

            return PartialView(quartosLivresReserva);

        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult Atualizar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagem.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("AtualizarReserva")]
        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "R";
            IPacoteHospedagem.Atualizar(pacoteHospedagem);
            return RedirectToAction("Index");
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult Excluir(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagem.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("ExcluirReserva")]
        [Authorize(Roles = "Administrador, Gerente, Recepcionista")]
        public ActionResult Excluir(PacoteHospedagem pacoteHospedagem)
        {
            IPacoteHospedagem.Remover(pacoteHospedagem);
            return RedirectToAction("Index");
        }
    }
}