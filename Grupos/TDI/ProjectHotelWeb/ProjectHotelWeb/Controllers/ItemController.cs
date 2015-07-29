﻿using Dominio.Classes;
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

        // GET: Item
        public ActionResult Index()
        {
            List<Item> itens = IItem.Listar().ToList<Item>();
            return View(itens);
        }

        public ActionResult Cadastrar()
        {
            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            ViewBag.Produto = produtos;

            return View();
        }

        [HttpPost]
        public ActionResult CadastrarItem()
        {
            string id = Request.Params.Get("group1");
            string quantidade = Request.Params.Get("quantidade");

            Produto produto = IProduto.ResultadoUnico(Convert.ToInt32(id));
            Item item = new Item();
            item.valorTotal = Convert.ToInt32(quantidade) * produto.valor;
            item.idProduto = produto.idProduto;
            item.cancelado = false;
            item.dataCadastro = DateTime.Now;
            item.idHospedagem = 2;

            //IItem.Cadastrar(item);

            List<Produto> produtos = IProduto.Listar().ToList<Produto>();
            List<Item> itens = IItem.Listar().ToList<Item>();



            ViewBag.Produto = produtos;
            ViewBag.Item = itens;

            return View("Cadastrar");
        }
    }
}