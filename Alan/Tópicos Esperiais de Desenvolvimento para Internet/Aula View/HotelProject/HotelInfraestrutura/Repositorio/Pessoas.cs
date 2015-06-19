using HotelDominio.Classes;
using HotelDominio.Interfaces;
using HotelInfraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelInfraestrutura.Repositorio
{
    public class Pessoas: IPessoas
    {
        private IQueryable<Pessoa> pessoas;
        private IHotel unidadeTrabalho;

        private Pessoas(IQueryable<Pessoa> funcionarios, IHotel unidadeTrabalho)
        {
            this.pessoas = funcionarios;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Pessoas(IHotel iHotel, IHotel unidadeTrabalho) : 
               this(iHotel.Pessoas, unidadeTrabalho) { }

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
            return pessoas.SingleOrDefault(p => p.id_pessoa == idPessoa);
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
