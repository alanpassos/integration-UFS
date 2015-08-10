﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using ProjectHotelWeb.ClassesEspeciais;


namespace ProjectHotelWeb.Controllers
{
    public class ControleServicoController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IControleServicos IControleServicos { get; set; }
        public IPessoas IPessoas { get; set; }
        public IControleClientes ICliente { get; set; }
        public IHospedagens IHospedagens { get; set; }
        public IQuartos IQuartos { get; set; }
        public IServicos IServicos { get; set; }
        //public UserManager<User> userManager; 
      

        // GET: ControleServico
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult VincularServicoHospedagem(string idHospedagem)
        {
            Hospedagem hospedagem;
            ControleCliente cliente;
            Pessoa pessoaCliente;
            Quarto quarto;

            hospedagem = IHospedagens.ResultadoUnico(Convert.ToInt32(idHospedagem.Split('#')[0]));
            cliente = ICliente.ResultadoUnicoHospedagem(hospedagem.idHospedagem);
            List<Servico> servicos = IServicos.Listar().ToList<Servico>();
            pessoaCliente = IPessoas.ResultadoUnico(cliente.Pessoa.idPessoa);
            quarto = IQuartos.ResultadoUnico(hospedagem.idQuarto);


            TempData["hospedagem"] = hospedagem;


            ViewBag.Hospedagem = hospedagem;
            ViewBag.Cliente = cliente;
            ViewBag.Servicos = servicos;
            ViewBag.Pessoa = pessoaCliente;
            ViewBag.Quarto = quarto;


            return View();



        }

        [HttpPost]
        public ActionResult AdicionarServico()
        {

            string idServico = Request.Params.Get("listaServico");
            Servico servico = IServicos.ResultadoUnico(Convert.ToInt32(idServico));
            return PartialView(servico);

        }
        
        public ActionResult VincularServico (string idServico)
        {
            
            Hospedagem hospedagem = (Hospedagem) TempData["hospedagem"];
            

            int codigoServico = Convert.ToInt32(idServico.Trim());
            int quantidade = Convert.ToInt32(Request.Params.Get("quantidade")); 
            
            DateTime dataInicio = Convert.ToDateTime(Request.Params.Get("dataInicio"));
            string dataFinalizacao = Request.Params.Get("dataFim");
            ControleServico controleServico = new ControleServico();
            if (dataFinalizacao != "")
            {
                DateTime dataFim = Convert.ToDateTime(Request.Params.Get("dataFim"));
                controleServico.dataLiberacao = dataFim;
            
            }
            controleServico.idHospedagem = hospedagem.idHospedagem;
            controleServico.idServico = codigoServico;
            controleServico.idFuncionario = 2;
            controleServico.dataAbertura = dataInicio;
            controleServico.dataCadastro = DateTime.Now;
            controleServico.cancelado = false;

            for (int i = 0; i < quantidade; i++ )
            {
                IControleServicos.Cadastrar(controleServico);
            }

            
           return PartialView();

        }

        
    }
}