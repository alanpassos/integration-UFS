

using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Repositorio
{
    public class Pessoas : IPessoas
    {
        private IQueryable<Pessoa> pessoas;
        private IProjectHotel unidadeTrabalho;

        private Pessoas(IQueryable<Pessoa> pessoas, IProjectHotel unidadeTrabalho)
        {
            this.pessoas = pessoas;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Pessoas(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Funcionarios, unidadeTrabalho) { }

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
            return pessoas.SingleOrDefault(p => p.idPessoa == idPessoa && p.isFuncionario == false);
        }
        public ICollection<Pessoa> Listar()
        {
            return pessoas.Where(p => p.isFuncionario ==false).ToList();
                //OrderBy(p => p.nome).ToList();
        }

        public Pessoa ResultadoUnicoFuncionario(int idPessoa)
        {
            return pessoas.SingleOrDefault(p => p.idPessoa == idPessoa && p.isFuncionario);
        }
        public ICollection<Pessoa> ListarFuncionario()
        {
            return pessoas.Where(p => p.isFuncionario == true).ToList();
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
