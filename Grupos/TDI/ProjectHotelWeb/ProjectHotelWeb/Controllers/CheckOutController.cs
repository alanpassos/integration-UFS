using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectHotelWeb.ClassesEspeciais;


namespace ProjectHotelWeb.Controllers
{
    public class CheckOutController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IPacoteHospedagens IPacoteHospedagens { get; set; }
        public IPessoas IPessoas { get; set; }
        public IHospedagens IHospedagens { get; set; }
        // GET: CheckOut
        public ActionResult Index()
        {
            List<PacoteHospedagem> pacoteHospedagens = IPacoteHospedagens.ListarCheckout().ToList<PacoteHospedagem>();
            return View(pacoteHospedagens);
        }

        public ActionResult Detalhar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoCheckout(id);
            return View(pacoteHospedagem);
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [ActionName("CadastrarCheckout")]
        public ActionResult Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "K";
            IPacoteHospedagens.Cadastrar(pacoteHospedagem);
            return RedirectToAction("Index");
        }

        public ActionResult Atualizar(int id)
        {
            PacoteHospedagem pacoteHospedagem = IPacoteHospedagens.ResultadoUnicoCheckout(id);
            return View(pacoteHospedagem);
        }

        [ActionName("AtualizarCheckout")]
        public ActionResult Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            pacoteHospedagem.ativo = true;
            pacoteHospedagem.tipoPacote = "K";
            IPacoteHospedagens.Atualizar(pacoteHospedagem);
            return RedirectToAction("Index");
        }


        public ActionResult Checkout(string idHospedagem)
        {

            if (idHospedagem != null)
            {
                string[] ids = idHospedagem.Split('#');
                int idPacoteHospedagem = Convert.ToInt32(ids[1]);
                SuperCheckout.pacoteHospedagemSeleionada = IPacoteHospedagens.ResultadoUnico(idPacoteHospedagem);
            }


            List<Pessoa> clientes = new List<Pessoa>();
            foreach (var item in SuperCheckout.pacoteHospedagemSeleionada.ControleCliente)
            {
                if (item.isResponsavel)
                    clientes.Add(IPessoas.ResultadoUnico(item.idCliente));
            }
            ViewBag.Clientes = clientes;
            ViewBag.hospedagem = SuperCheckout.hospedagensIniciais;
            ViewBag.ControleServico = SuperCheckout.controleServicosSelecionados;
            return View(SuperCheckout.pacoteHospedagemSeleionada);
        }
        public ActionResult acicionarQuartos()
        {
            string[] ids = Request.Params.Get("check").Split(',');
            foreach (var idHospedagem in ids)
            {

                
                Hospedagem hospedagemSelect = new Hospedagem();
                hospedagemSelect = IHospedagens.ResultadoUnico(Convert.ToInt32(idHospedagem));

                if (!SuperCheckout.hospedagensIniciais.Contains(hospedagemSelect))
                {
                    SuperCheckout.hospedagensIniciais.Add(hospedagemSelect);

                    removerHospedagensSelecionadas(Convert.ToInt32(idHospedagem));
                }
            }
            return RedirectToAction("Checkout");
        }
        
        private void removerHospedagensSelecionadas(int idHospedagem)
        {
            for (int i = 0; i < SuperCheckout.pacoteHospedagemSeleionada.Hospedagem.Count; i++)
            {
                if (SuperCheckout.pacoteHospedagemSeleionada.Hospedagem[i].idHospedagem == idHospedagem)
                {

                    SuperCheckout.pacoteHospedagemSeleionada.Hospedagem.RemoveAt(i);
                    break;

                }
            }


        }

        public ActionResult adicionarHospedagensExcluidas(int idHospedagem)
        {

            SuperCheckout.pacoteHospedagemSeleionada.Hospedagem.Add(IHospedagens.ResultadoUnico(idHospedagem));
            for (int i = 0; i < SuperCheckout.hospedagensIniciais.Count; i++)
            {
                if (SuperCheckout.hospedagensIniciais[i].idHospedagem == idHospedagem)
                {

                    SuperCheckout.hospedagensIniciais.RemoveAt(i);
                    break;
                }

            }
            return RedirectToAction("Checkout");
        }

        public ActionResult ListarServicos(int idHospedagem)
        {
            Hospedagem hospedagem = IHospedagens.ResultadoUnico(idHospedagem);
            SuperCheckout.controleServicosSelecionados = new List<ControleServico>();
            SuperCheckout.controleServicosSelecionados.AddRange(hospedagem.ControleServico);



            return RedirectToAction("Checkout");
        }
    }
}