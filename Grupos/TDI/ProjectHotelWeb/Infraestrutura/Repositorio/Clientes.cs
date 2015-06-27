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
   public class Clientes: IClientes
    {
        private IQueryable<Cliente> clientes;
        private IProjectHotel unidadeTrabalho;

        private Clientes(IQueryable<Cliente> clientes, IProjectHotel unidadeTrabalho)
        {
            this.clientes = clientes;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Clientes(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Clientes, unidadeTrabalho) { }

        public void Cadastrar(Cliente cliente)
        {
            unidadeTrabalho.RegistrarNovo(cliente);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Cliente cliente)
        {
            unidadeTrabalho.RegistrarAlterado(cliente);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Cliente cliente)
        {
            unidadeTrabalho.RegistrarRemovido(cliente);
            unidadeTrabalho.Salvar();
        }

        public Cliente ResultadoUnico(int idCliente)
        {
            return clientes.SingleOrDefault(p => p.idPessoa == idCliente && p.isFuncionario == false);
        }
        public ICollection<Cliente> Listar()
        {
            return clientes.Where(p => p.isFuncionario == false && p.ativo == true).OrderBy(p=> p.nome).ToList();
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
