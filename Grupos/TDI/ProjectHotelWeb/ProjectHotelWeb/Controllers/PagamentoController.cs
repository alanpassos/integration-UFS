﻿using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectHotelWeb.ClassesEspeciais;
using Dominio.Classes_Especiais;

namespace ProjectHotelWeb.Controllers
{
    public class PagamentoController : Controller
    {

        public IProjectHotel IProjectHotel { get; set; }
        public IPagamentos IPagamento { get; set; }
        public IFormaPagamentos IFormaPagamentos { get; set; }
        public IHospedagens IHospedagens { get; set; }
        public IPacoteHospedagens IPacoteHospedagens { get; set; }
        public IQuartos IQuartos { get; set; }
        public IControleClientes IControleClientes { get; set; }

        public IPessoas IPessoas { get; set; }
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
        public ActionResult Excluir(int id)
        {
            Pagamento pagamento = IPagamento.ResultadoUnico(id);
            return View(pagamento);
        }

        [ActionName("ExcluirPagamento")]
        public ActionResult Excluir(Pagamento pagamento)
        {
            IPagamento.Remover(pagamento);
            return RedirectToAction("Index");
        }


        public ActionResult Pagamento(string hospedagensSelect)
        {





            decimal valorTotal = 0;
            if (hospedagensSelect != null)
            {
                string[] hospedagens = hospedagensSelect.Split(',');

                foreach (var item in hospedagens)
                {

                    Hospedagem hospedagem = new Hospedagem();
                    hospedagem = null;
                    hospedagem = IHospedagens.ResultadoUnico(Convert.ToInt32(item));
                    if (!PagamentoGlobal.superPagamento.hospedagensIniciais.Contains(hospedagem))
                        PagamentoGlobal.superPagamento.hospedagensIniciais.Add(hospedagem);

                }



                foreach (var hospedagem in PagamentoGlobal.superPagamento.hospedagensIniciais)
                {
                    foreach (var cCliente in hospedagem.ControleCliente)
                    {
                        if (cCliente.isResponsavel)
                        {

                            if (!PagamentoGlobal.superPagamento.pessoasSelecionadas.Contains(cCliente.Pessoa))
                                PagamentoGlobal.superPagamento.pessoasSelecionadas.Add(cCliente.Pessoa);
                            break;
                        }
                    }
                }
                foreach (var item in PagamentoGlobal.superPagamento.hospedagensIniciais)
                {
                    valorTotal += item.valorHospedagem;
                }

                PagamentoGlobal.superPagamento.valorTotal = valorTotal;
            }





            ViewBag.Hospedagens = PagamentoGlobal.superPagamento.hospedagensIniciais;
            ViewBag.Clientes = PagamentoGlobal.superPagamento.pessoasSelecionadas;
            ViewBag.FormaPagamento = IFormaPagamentos.Listar();
            ViewBag.Valor = PagamentoGlobal.superPagamento.valorTotal;
            ViewBag.FormaPagamentoAtuais = PagamentoGlobal.pagamentos;
            ViewBag.ValorPago = PagamentoGlobal.valorPago;
            ViewBag.Troco = PagamentoGlobal.valorPago - PagamentoGlobal.superPagamento.valorTotal;
            return View();

        }

        public ActionResult pagamentoAvista()
        {

            string idFormaPagamento = Request.Params.Get("group1");
            string valorPagoView = Request.Params.Get("valorPago");

            switch (Convert.ToInt32(idFormaPagamento))
            {
                case 1:

                    break;

                default:
                    break;
            }




            return View();
        }


        public ActionResult AdicionarPagamento()
        {

            string idFormaPagamento = Request.Params.Get("group1");
            string valorPagoView = Request.Params.Get("valorPago");


            switch (Convert.ToInt32(idFormaPagamento))
            {
                case 1:

                    if (PagamentoGlobal.pagamentos.Count > 0)
                    {

                        foreach (var item in PagamentoGlobal.pagamentos)
                        {
                            if (item.formaPagamentosAtuais.tipo.Equals("A"))
                            {
                                item.valorPago += Convert.ToDecimal(valorPagoView);
                                break;
                            }

                        }

                    }
                    else
                    {

                        PagamentoGlobal.pagamentos.Add(new TipoPagamento()
                        {
                            formaPagamentosAtuais = IFormaPagamentos.ResultadoUnicoTipo("A")[0],
                            valorPago = Convert.ToDecimal(valorPagoView)
                        });
                    }
                    break;

                default:
                    break;
            }



            PagamentoGlobal.valorPago += Convert.ToDecimal(valorPagoView);

            return View("Pagamento");
        }

        public ActionResult FinalizarPagamento()
        {

            if (PagamentoGlobal.valorPago >= PagamentoGlobal.superPagamento.valorTotal)
            {
                foreach (var hospedagem in PagamentoGlobal.superPagamento.hospedagensIniciais)
                {
                    foreach (var item in PagamentoGlobal.pagamentos)
                    {
                        PersistirPagamento(item, hospedagem.idPacoteHospedagem);
                    }


                    PacoteHospedagem pacote = IPacoteHospedagens.ResultadoUnico(hospedagem.idPacoteHospedagem);
                    pacote.valorTotal -= hospedagem.valorHospedagem;

                    IPacoteHospedagens.Atualizar(pacote);
                }
            }

            LiberarHospedagem();
            LimparAtributos();

            return RedirectToAction("Index", "Home");
        }
        private void PersistirPagamento(TipoPagamento tipo, int idPacote)
        {
            Pagamento pagamento = new Pagamento();
            List<Pagamento> pagamentos = new List<Pagamento>();

            for (int i = 0; i < tipo.formaPagamentosAtuais.numeroMaximoParcela; i++)
            {
                pagamento = new Pagamento();
                pagamento.dataCadastro = DateTime.Now;
                pagamento.dataPrevista = DateTime.Now;
                pagamento.dataPrevista.AddMonths(i);

                pagamento.idFormaPagamento = tipo.formaPagamentosAtuais.idFormaPagamento;
                pagamento.valorParcela = (PagamentoGlobal.valorPago / tipo.formaPagamentosAtuais.numeroMaximoParcela);
                pagamento.status = "P";
                pagamento.idPacoteHospedagem = idPacote;
                IPagamento.Cadastrar(pagamento);
            }

        }

        private void LiberarHospedagem()
        {

            foreach (var hospedagem in PagamentoGlobal.superPagamento.hospedagensIniciais)
            {
                Hospedagem hosp = new Hospedagem();
                hosp = IHospedagens.ResultadoUnico(hospedagem.idHospedagem);

                hosp.dataLiberacao = DateTime.Now;
                hosp.aberto = false;

                IHospedagens.Atualizar(hosp);


            }
            foreach (var hospedagem in PagamentoGlobal.superPagamento.hospedagensIniciais)
            {



                Quarto quarto = new Quarto();
                quarto = IQuartos.ResultadoUnico(hospedagem.idQuarto);
                quarto.status = "L";
                IQuartos.Atualizar(quarto);

            }
        }

        private void LimparAtributos()
        {
            PagamentoGlobal.superPagamento = new SuperPagamento();

            PagamentoGlobal.pagamentos = new List<TipoPagamento>();

            PagamentoGlobal.valorPago = 0;
        }
    }
}