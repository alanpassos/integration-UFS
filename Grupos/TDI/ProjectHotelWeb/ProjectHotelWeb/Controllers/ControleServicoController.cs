using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using ProjectHotelWeb.ClassesEspeciais;
using Dominio.Classes_Especiais;
using Microsoft.AspNet.Identity;
using ProjectHotelWeb.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using IdentitySample.Models;



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
       
        public UserManager<User> userManager;

        public ControleServicoController ()
        {
            UserDbContext db = new UserDbContext();
            UserStore<User> userStore = new UserStore<User>(db);
            userManager = new UserManager<User>(userStore);

        }
        
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

            hospedagem = IHospedagens.ResultadoUnico(Convert.ToInt32(idHospedagem.Split('/')[0]));
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
            ControleServico controleServico = new ControleServico();
            controleServico.idHospedagem = hospedagem.idHospedagem;
            controleServico.idServico = codigoServico;
            string usuarioId = User.Identity.GetUserId();
            User usuario = userManager.FindById(usuarioId);
            controleServico.idFuncionario = usuario.idFuncionario;
            controleServico.dataAbertura = dataInicio;
            controleServico.dataCadastro = DateTime.Now;
            controleServico.cancelado = false;

            for (int i = 0; i < quantidade; i++ )
            {
                IControleServicos.Cadastrar(controleServico);
            }

            TempData["hospedagem"] = hospedagem;
            
            List<ServicoHospedagem> servicosHospedagens = IControleServicos.ListarServicoHospedagem(hospedagem.idHospedagem).ToList();

            return PartialView(servicosHospedagens);

        }
        
    }
}