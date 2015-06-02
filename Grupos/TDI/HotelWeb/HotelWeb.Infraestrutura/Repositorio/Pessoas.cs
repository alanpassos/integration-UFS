using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HotelWeb.Dominio.Classes;
using HotelWeb.Infraestrutura.Database;
using HotelWeb.Dominio.Interfaces;

namespace HotelWeb.Infraestrutura.Repositorio
{
    public class Pessoas : IPessoas
    {
        private IQueryable<Pessoa> pessoas;
        private IExemplo unidadeTrabalho;

        private Pessoas(IQueryable<Pessoa> pessoas, IExemplo unidadeTrabalho)
        {
            this.pessoas = pessoas;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Pessoas(IExemplo iExemplo, IExemplo unidadeTrabalho) : 
               this(iExemplo.Pessoas, unidadeTrabalho) { }

        public void Cadastrar(Pessoa pessoa)
        {
            unidadeTrabalho.RegistrarNovo(pessoa);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Pessoa pessoa)
        {
            unidadeTrabalho.RegistrarAlterado(pessoa);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Pessoa pessoa)
        {
            unidadeTrabalho.RegistrarRemovido(pessoa);
            unidadeTrabalho.Salvar();
        }

        public Pessoa ResultadoUnico(int idPessoa)
        {
            return pessoas.SingleOrDefault(f => f.id == idPessoa);
        }

        public ICollection<Pessoa> Listar()
        {
            return pessoas.OrderBy(p => p.nome).ToList();
        }

        public bool ContemRegistro()
        {
            throw new NotImplementedException();
        }

        public int TotalRegistros()
        {
            throw new NotImplementedException();
        }
    }
}
