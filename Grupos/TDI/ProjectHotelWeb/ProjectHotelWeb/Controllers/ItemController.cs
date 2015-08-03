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
    public class ItemController : Controller
    {
        public IProjectHotel IProjectHotel { get; set; }
        public IItens IItem { get; set; }
        public IProdutos IProduto { get; set; }
        public IHospedagens IHospedagem { get; set; }
        public IPessoas IPessoa { get; set; }
        public Hospedagem hospedagem { get; set; }


        // GET: Item
        public ActionResult Index()
        {
            List<Item> itens = IItem.Listar().ToList<Item>();
            return View(itens);
        }


        public ActionResult Cadastrar()
        {
            hospedagem = IHospedagem.ResultadoUnico(1);
            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            ViewBag.Produto = produtos;

            List<Item> itens = IItem.ListarItemPorHspedagem(hospedagem.idHospedagem).ToList<Item>();
            ViewBag.Item = itens;
                
            ClienteHospedagem();

            return View();
        }

        public ActionResult Teste(string idHospedagem)
        {
            hospedagem = IHospedagem.ResultadoUnico(Convert.ToInt32(idHospedagem));
            ViewBag.Hospedagem = hospedagem;
            return PartialView();
        }

		private void ClienteHospedagem()
        {
            Pessoa cliente = new Pessoa();
            foreach (var c in hospedagem.ControleCliente)
            {
                if (c.isResponsavel)
                {
                    cliente = IPessoa.ResultadoUnico(c.idCliente);
                    break;
                }
            }
            ViewBag.Hospedagem = hospedagem;
            ViewBag.Cliente = cliente;
        }

		
        [HttpPost]
        public ActionResult CadastrarItem()
        {
            string id = Request.Params.Get("group1");
            string quantidade = Request.Params.Get("quantidade");
            hospedagem = IHospedagem.ResultadoUnico(1);
            Produto produto = IProduto.ResultadoUnico(Convert.ToInt32(id));
            Item item = new Item();
            item.valorTotal = Convert.ToInt32(quantidade ) * produto.valor;
            item.quantidade = Convert.ToInt32(quantidade);
            item.idProduto = produto.idProduto;
            item.cancelado = false;
            item.dataCadastro = DateTime.Now;
            item.idHospedagem = hospedagem.idHospedagem;
            if (produto.quantidade >= Convert.ToInt32(quantidade))
            {
                IItem.CadastrarNovo(item);
                hospedagem.valorHospedagem += item.valorTotal;
                IHospedagem.Atualizar(hospedagem);
               
			}

            hospedagem = IHospedagem.ResultadoUnico(1);
            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            List<Item> itens = IItem.ListarItemPorHspedagem(hospedagem.idHospedagem).ToList<Item>();
			ViewBag.Produto = produtos;
            ViewBag.Item = itens;
			ClienteHospedagem();
            
            return RedirectToAction("Cadastrar");
	
        }

        public ActionResult Atualizar(int id)
        {
            hospedagem = IHospedagem.ResultadoUnico(1);
            Item item = IItem.ResultadoUnico(id);
            ClienteHospedagem();
            return View(item);
        }

        [ActionName("AtualizarItem")]
        public ActionResult Atualizar(Item item)
        {
            hospedagem = IHospedagem.ResultadoUnico(1);
            hospedagem.valorHospedagem += item.valorTotal;
            IHospedagem.Atualizar(hospedagem);
            IItem.Atualizar(item);
            return RedirectToAction("Cadastrar");
        }

        [HttpPost]
        public ActionResult CancelarItem()
        {
            string[] itensCancelados = Request.Params.Get("checkCancelar").Split(',', ' ');
            string idHospedagem = itensCancelados[1];
            string idItem;
            Item itemCancelado;
            Hospedagem hospedagemItemCancelado;

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