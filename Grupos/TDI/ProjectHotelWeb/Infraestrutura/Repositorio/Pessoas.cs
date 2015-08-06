

using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            return pessoas.SingleOrDefault(p => p.idPessoa == idPessoa && p.ativo == true);
        }
        public ICollection<Pessoa> Listar()
        {
            return pessoas.Where(p =>p.ativo == true).OrderBy(p=> p.nome).ToList();
            //OrderBy(p => p.nome).ToList();
        }

        public ICollection<Pessoa> ListarPorCpfCnpj(string cpfCnpj)
        {
            return pessoas.Where(p => p.ativo == true && p.cpfCnpj == cpfCnpj).OrderBy(p => p.nome).ToList();
            //OrderBy(p => p.nome).ToList();
        }

        public ICollection<Pessoa> ListarPorNome(string nome)
        {
            
            return pessoas.Where(p => p.ativo == true && p.nome.Contains(nome)).OrderBy(p => p.nome).ToList();
            //OrderBy(p => p.nome).ToList();
        }
        public ICollection<Pessoa> ListarPorTelefone(string telefone)
        {
            return pessoas.Where(p => p.telefoneMovel == telefone && p.ativo == true).ToList();
        }

        public ICollection<Pessoa> ListarFuncionario()
        {
            return pessoas.Where(p => p.isFuncionario == true && p.ativo == true).OrderBy(p => p.nome).ToList();
            //OrderBy(p => p.nome).ToList();
        }
        public Pessoa ResultadoUnicoFuncionario(int idPessoa)
        {
            return pessoas.SingleOrDefault(p => p.idPessoa == idPessoa  && p.ativo == true);
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
