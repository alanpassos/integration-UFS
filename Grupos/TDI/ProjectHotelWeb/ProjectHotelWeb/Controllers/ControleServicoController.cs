using System;
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
        public IPessoas IPessoas { get; set; }
        public IControleClientes ICliente { get; set; }
        public IHospedagens IHospedagens { get; set; }
        public IQuartos IQuartos { get; set; }
        public IServicos IServicos { get; set; }
   

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
            if (idHospedagem != null)
           {
                hospedagem = IHospedagens.ResultadoUnico(Convert.ToInt32(idHospedagem.Split('#')[0]));
                cliente = ICliente.ResultadoUnicoHospedagem(hospedagem.idHospedagem);
                List<Servico> servicos = IServicos.Listar().ToList<Servico>();
                pessoaCliente = IPessoas.ResultadoUnico(cliente.Pessoa.idPessoa);
                quarto = IQuartos.ResultadoUnico(hospedagem.idQuarto);

                ViewBag.Hospedagem = hospedagem;
                ViewBag.Cliente = cliente;
                ViewBag.Servicos = servicos;
                ViewBag.Pessoa = pessoaCliente;
                ViewBag.Quarto = quarto;

                return View();

           }

            return RedirectToAction("Home", "Home");

        }
        
    }
}