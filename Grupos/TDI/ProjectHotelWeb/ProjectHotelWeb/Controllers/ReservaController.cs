using Dominio.Classes;
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
        public IPacoteHospedagens IPacoteHospedagens { get; set; }
        public ITipoQuartos ITipoQuarto { get; set; }
        public IPessoas IPessoas { get; set; }
        public IControleClientes IControleCliente { get; set; }
        public IHospedagens IHospedagem { get; set; }

        // GET: Reserva
        public ActionResult Index()
        {
            List<PacoteHospedagem> pacoteHospedagens = IPacoteHospedagens.ListarReserva().ToList<PacoteHospedagem>();
            return View(pacoteHospedagens);
        }

        public ActionResult Detalhar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        public ActionResult Cadastrar()
        {
            List<TipoQuarto> tipoQuartos = ITipoQuarto.Listar().ToList<TipoQuarto>();
            ViewBag.tipoQuarto = tipoQuartos;

            if(TempData["quartos"] != null)
            {
                ViewBag.quartosLivres = (List<QuartosLivresReserva>)TempData["quartos"];
                ViewBag.dataInicioFim = (List<DateTime>)TempData["datas"];
                List<object> dadosCliente = (List<object>)TempData["dadosView"];
                TempData["dadosCliente"] = dadosCliente;
                ViewBag.dadosView = dadosCliente;
            }
            
            return View();
            
        }

        [ActionName("CadastrarReserva")]
        public ActionResult Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            CultureInfo culture = new CultureInfo("pt-BR");
            List<object> dadosCliente = (List<object>)TempData["dadosCliente"];

            string dataInicio = Request.Params.Get("dataInicio");
            string dataFim = Request.Params.Get("dataFim");

            string[] quartosSelecionados = Request.Params.Get("checkQuartos").Split(',', ' ');

            List<Pessoa> pessoaResultado = IPessoas.ListarPorCpfCnpj((string)dadosCliente[0]).ToList();
            Pessoa cliente;
            int idCliente;
            if(pessoaResultado.Count == 0)
            {
                cliente = new Pessoa();
                cliente.cpfCnpj = (string)dadosCliente[0];
                cliente.nome = (string)dadosCliente[1];
                cliente.telefoneMovel = (string)dadosCliente[2];
                cliente.ativo = true;
                cliente.isFuncionario = false;
                cliente.dataCadastro = DateTime.Now;
                cliente.estado = "";
                IPessoas.Cadastrar(cliente);
            }
            idCliente = IPessoas.ListarPorCpfCnpj((string)dadosCliente[0]).ToList()[0].idPessoa;
           
            int idPacoteHospedagem = IPacoteHospedagens.Cadastrar(
                new PacoteHospedagem()
                {
                    dataCadastro = DateTime.Now,
                    tipoPacote = "R",
                    ativo = true,
                    dataEntrada = Convert.ToDateTime(dataInicio),
                    dataSaida = Convert.ToDateTime(dataFim),
                    subTotal = 0,
                    valorTotal = 0
                });


            for (int i = 0; i < quartosSelecionados.Count(); i += 3)
            {
                int idHospedagem = IHospedagem.Cadastrar(
                 new Hospedagem()
                 {
                     aberto = true,
                     idPacoteHospedagem = idPacoteHospedagem,
                     dataAbertura = DateTime.Now,
                     dataLiberacao = DateTime.Now,                  
                     idQuarto = Convert.ToInt32(quartosSelecionados[i+2]),
                     valorHospedagem = 0
                 });

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
         

            return RedirectToAction("Cadastrar");
        }

        public ActionResult Consultar()
        {
            string cpf = Request.Params.Get("cpf").Replace(".","").Replace("-","");
            string nomeCliente = Request.Params.Get("nome");
            string telefone = Request.Params.Get("telefone");

            CultureInfo culture = new CultureInfo("pt-BR");

            DateTime dataInicio = Convert.ToDateTime(Request.Params.Get("dataInicio"), culture);
            DateTime dataFim = Convert.ToDateTime(Request.Params.Get("dataFim"), culture);
            string tipoQuarto = Request.Params.Get("tipoQuarto");
            string numeroPessoas = Request.Params.Get("pessoas");
            string numeroQuartos = Request.Params.Get("quartos");

            List<QuartosLivresReserva> quartosLivresReserva = ITipoQuarto.ListaLivres(tipoQuarto, numeroPessoas, dataInicio, dataFim).ToList<QuartosLivresReserva>();
            List<DateTime> dataInicioFim = new List<DateTime>();
            dataInicioFim.Add(dataInicio);
            dataInicioFim.Add(dataFim);
            List<object> dadosView = new List<object>();
            dadosView.Add(cpf);
            dadosView.Add(nomeCliente);
            dadosView.Add(telefone);

            TempData["dadosView"] = dadosView;
            TempData["quartos"] = quartosLivresReserva;
            TempData["datas"] = dataInicioFim;

            return RedirectToAction("Cadastrar");
        }

        public ActionResult Atualizar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("AtualizarReserva")]
        public ActionResult Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "R";
            IPacoteHospedagens.Atualizar(pacoteHospedagem);
            return RedirectToAction("Index");
        }

        public ActionResult Excluir(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoReserva(id);
            return View(pacoteHospedagem);
        }

        [ActionName("ExcluirReserva")]
        public ActionResult Excluir(PacoteHospedagem pacoteHospedagem)
        {
            IPacoteHospedagens.Remover(pacoteHospedagem);
            return RedirectToAction("Index");
        }
    }
}