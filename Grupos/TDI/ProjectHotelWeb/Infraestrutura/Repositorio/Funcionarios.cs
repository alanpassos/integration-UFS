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
   public class Funcionarios: IFuncionarios
    {
        private IQueryable<Funcionario> funcionarios;
        private IProjectHotel unidadeTrabalho;

        private Funcionarios(IQueryable<Funcionario> funcionarios, IProjectHotel unidadeTrabalho)
        {
            this.funcionarios = funcionarios;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Funcionarios(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Funcionarios, unidadeTrabalho) { }

        public void Cadastrar(Funcionario funcionario)
        {
            unidadeTrabalho.RegistrarNovo(funcionario);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Funcionario funcionario)
        {
            unidadeTrabalho.RegistrarAlterado(funcionario);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Funcionario funcionario)
        {
            unidadeTrabalho.RegistrarRemovido(funcionario);
            unidadeTrabalho.Salvar();
        }

        public Funcionario ResultadoUnico(int idFuncionario)
        {
            return funcionarios.SingleOrDefault(p => p.idPessoa== idFuncionario && p.isFuncionario == false);
        }
        public ICollection<Funcionario> Listar()
        {
            return funcionarios.Where(p => p.isFuncionario == true && p.ativo == true).OrderBy(p=> p.nome).ToList();
            //OrderBy(p => p.nome).ToList();
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
