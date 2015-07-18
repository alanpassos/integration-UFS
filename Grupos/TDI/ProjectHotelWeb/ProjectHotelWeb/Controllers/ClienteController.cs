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
    public class ClienteController : Controller
    {
        
        // GET: Funcionario
        public IProjectHotel IAcademic { get; set; }

        public IPessoas iPessoas { get; set; }

        
        // GET: Cliente
        public ActionResult Index()
        {

            List<Pessoa> pessoas = iPessoas.Listar().ToList<Pessoa>();
            

            return View(pessoas);
        }

        public ActionResult Cadastrar()
        {

          
            
                return View();
            
        }


        [ActionName("CadastrarCliente")]
        public ActionResult Cadastrar(Pessoa pessoa)
        {

            pessoa.isFuncionario = false;
            pessoa.dataCadastro = DateTime.Now;
            pessoa.ativo = true;
            pessoa.dataNascimento = Convert.ToDateTime(Request.Params.Get("Nascimento"));
            pessoa.estadoCivil = Request.Params.Get("estadoCivil");
            
            pessoa.estado = Request.Params.Get("Estado");
            pessoa.sexo = Request.Params.Get("sexo");
            iPessoas.Cadastrar(pessoa);

            return RedirectToAction("Index");
        }
        public ActionResult Atualizar(int id)
        {


            Pessoa pessoa = iPessoas.ResultadoUnico(id);
            
            return View(pessoa);
        }
        [ActionName("AtualizarCliente")]
        public ActionResult Atualizar(Pessoa pessoa)
        {
            
            pessoa.ativo = Convert.ToBoolean(Request.Params.Get("ativo"));
            pessoa.isFuncionario = Convert.ToBoolean(Request.Params.Get("funcionario"));
            pessoa.dataNascimento = Convert.ToDateTime(Request.Params.Get("Nascimento"));
            pessoa.estadoCivil = Request.Params.Get("estadoCivil");
            pessoa.estado = Request.Params.Get("Estado");
            pessoa.sexo = Request.Params.Get("sexo");
            iPessoas.Atualizar(pessoa);

            return RedirectToAction("Index");
        }
        public ActionResult Excluir(int id)
        {
            Pessoa pessoa = iPessoas.ResultadoUnico(id);
            return View(pessoa);
        }



        [ActionName("ExcluirCliente")]
        public ActionResult Excluir(Pessoa pessoa)
        {
            Pessoa newPessoa = iPessoas.ResultadoUnico(pessoa.idPessoa);
            if (newPessoa != null)
            {
                newPessoa.ativo = false;
                iPessoas.Atualizar(newPessoa);
            }
            else
                return null;

            return RedirectToAction("Index");
        }



        public ActionResult Detalhar(int id)
        {
            Pessoa pessoa = iPessoas.ResultadoUnico(id);


            return View(pessoa);
        }


    }
}