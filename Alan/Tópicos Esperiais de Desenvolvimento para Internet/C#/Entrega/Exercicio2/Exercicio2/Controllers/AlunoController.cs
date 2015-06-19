using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Exercicio2.Controllers
{
    public class AlunoController : Controller
    {
        // GET: Aluno
        public ActionResult Index()
        {
            return View();
        }

        [ActionName("DadosAluno")]
        public ActionResult DadosAluno(Aluno aluno)
        {

            ViewBag.Matricula =  aluno.matricula;
            ViewBag.Nome =  aluno.nome;
            ViewBag.Curso = aluno.curso;

            return View();

        }
        [ActionName("DadosAlunoNovo")]
        public ActionResult DadosAluno(string nome)
        {       
            ViewBag.Nome = "Nome: " + nome;
         
            return View();

        }
    }
}