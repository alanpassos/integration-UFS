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
    public class ItemController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IItens IItem { get; set; }
        public IProdutos IProduto { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IPessoas IPessoa { get; set; }
        public Hospedagem hospedagem { get; set; }

        // GET: Item

        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Index()
        {
            List<Item> itens = IItem.Listar().ToList<Item>();
            return View(itens);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Cadastrar(string idHospedagem)
        {
            if(idHospedagem != null)
            {
                Entidade.hospedagemGlobal = IHospedagem.ResultadoUnico(Convert.ToInt32(idHospedagem.Split('/')[0]));
            }
            else
            {
                int id = Entidade.hospedagemGlobal.idHospedagem;
                Entidade.hospedagemGlobal = new Hospedagem();
                Entidade.hospedagemGlobal = IHospedagem.ResultadoUnico(id);
            }
            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            ViewBag.Produto = produtos;

            List<Item> itens = IItem.ListarItemPorHspedagem(Entidade.hospedagemGlobal.idHospedagem).ToList<Item>();
            ViewBag.Item = itens;          
            ClienteHospedagem();

            return View();
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Detalhar(int id)
        {
            Item item = IItem.ResultadoUnico(id);
            return View(item);
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult Cadastro(string idHospedagem)
        {
            hospedagem = IHospedagem.ResultadoUnico(Convert.ToInt32(idHospedagem));
            ViewBag.idHospedagem = hospedagem.idHospedagem;
            return View();
        }

		private void ClienteHospedagem()
        {
            Pessoa cliente = new Pessoa();
            foreach (var c in Entidade.hospedagemGlobal.ControleCliente)
            {
                if (c.isResponsavel)
                {
                    cliente = IPessoa.ResultadoUnico(Convert.ToInt32(c.idCliente));
                    break;
                }
            }
            ViewBag.Hospedagem = Entidade.hospedagemGlobal;
            ViewBag.Cliente = cliente;
        }

        [HttpPost]

        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult CadastrarItem()
        {
            string id = Request.Params.Get("group1");
            string quantidade = Request.Params.Get("quantidade");

            Produto produto = IProduto.ResultadoUnico(Convert.ToInt32(id));
            Item item = new Item();
            item.valorTotal = Convert.ToInt32(quantidade ) * produto.valor;
            item.quantidade = Convert.ToInt32(quantidade);
            item.idProduto = produto.idProduto;
            item.cancelado = false;
            item.dataCadastro = DateTime.Now;
            item.idHospedagem = Entidade.hospedagemGlobal.idHospedagem;
            if (produto.quantidade >= Convert.ToInt32(quantidade))
            {
                Hospedagem hospedagemAtualizada = IHospedagem.ResultadoUnico(Entidade.hospedagemGlobal.idHospedagem);
                IItem.CadastrarNovo(item);
                hospedagemAtualizada.valorHospedagem += item.valorTotal;
                IHospedagem.Atualizar(hospedagemAtualizada);
               
			}

            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            List<Item> itens = IItem.ListarItemPorHspedagem(Entidade.hospedagemGlobal.idHospedagem).ToList<Item>();
			ViewBag.Produto = produtos;
            ViewBag.Item = itens;
			ClienteHospedagem();

            return RedirectToAction("Cadastrar");
	
        }


        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Atualizar(int id)
        {
            
            Item item = IItem.ResultadoUnico(id);
            return PartialView(item);
        }

        [ActionName("AtualizarItem")]

        [Authorize(Roles = "Administrador, Gerente")]
        public ActionResult Atualizar(Item item)
        {
            decimal valorNovo;
            decimal valorAntigo;
            Hospedagem _hospedagem = IHospedagem.ResultadoUnico(item.idHospedagem);
            Item _item = IItem.ResultadoUnico(item.idItem);

            if(item.quantidade > _item.quantidade)
            {
                return RedirectToAction("Cadastrar", new { idHospedagem = _hospedagem.idHospedagem });
            }

            valorAntigo = _item.valorTotal;
            _item.quantidade = item.quantidade;
            valorNovo = (item.quantidade * _item.Produto.valor);
            _item.valorTotal = valorNovo;
            _hospedagem.valorHospedagem += (valorNovo - valorAntigo);
            IHospedagem.Atualizar(_hospedagem);
            IItem.Atualizar(_item);
            return RedirectToAction("Cadastrar", new { idHospedagem = _hospedagem.idHospedagem});
        }


        [Authorize(Roles = "Administrador, Gerente, Recepcionista, Convidado")]
        public ActionResult CancelarItem()
        {
            string[] itensCancelados = Request.Params.Get("checkCancelar").Split(',', ' ');
            string idHospedagem = itensCancelados[1];
            string idItem;
            Item itemCancelado;
            Hospedagem hospedagemItemCancelado = new Hospedagem();

            for (int i = 0; i < itensCancelados.Count(); i += 2 )
            {
                idItem = itensCancelados[i];
                itemCancelado = IItem.ResultadoUnico(Convert.ToInt32(idItem));
                itemCancelado.cancelado = true;
                IItem.Atualizar(itemCancelado);

                hospedagemItemCancelado = IHospedagem.ResultadoUnico(Convert.ToInt32(idHospedagem));
                hospedagemItemCancelado.valorHospedagem -= itemCancelado.valorTotal;
                IHospedagem.Atualizar(hospedagemItemCancelado);
            }

            return RedirectToAction("Cadastrar");
        }

    }
}