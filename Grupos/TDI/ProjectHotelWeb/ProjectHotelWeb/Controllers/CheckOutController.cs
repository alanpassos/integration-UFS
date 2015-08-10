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


        public ActionResult Checkout(string hospedagensSelect)
        {
            string[] hospedagens = hospedagensSelect.Split(',');
            
            if (hospedagens != null)
            {
                foreach (var item in hospedagens)
                {
                    string[] ids = item.Split('#');
                    int idHospedagem = Convert.ToInt32(ids[0]);
                    Hospedagem hospedagem = new Hospedagem();
                    hospedagem = IHospedagens.ResultadoUnico(idHospedagem);
                    if(!SuperCheckout.hospedagemSeleionada.Contains(hospedagem))
                        SuperCheckout.hospedagemSeleionada.Add(hospedagem);

                }
            }


           

            List<Pessoa> clientes = new List<Pessoa>();
            foreach (var item in SuperCheckout.hospedagemSeleionada)
            {
                foreach (var controle in item.ControleCliente)
                {


                    if (controle.isResponsavel)
                        clientes.Add(IPessoas.ResultadoUnico(controle.idCliente));
                }
            }
            ViewBag.Clientes = clientes;
            ViewBag.hospedagem = SuperCheckout.hospedagensIniciais;
            ViewBag.ControleServico = SuperCheckout.controleServicosSelecionados;
            return View(SuperCheckout.hospedagemSeleionada);
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
            for (int i = 0; i < SuperCheckout.hospedagemSeleionada.Count; i++)
            {
                if (SuperCheckout.hospedagemSeleionada[i].idHospedagem == idHospedagem)
                {

                    SuperCheckout.hospedagemSeleionada.RemoveAt(i);
                    break;

                }
            }


        }

        public ActionResult adicionarHospedagensExcluidas(int idHospedagem)
        {

            SuperCheckout.hospedagemSeleionada.Add(IHospedagens.ResultadoUnico(idHospedagem));
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