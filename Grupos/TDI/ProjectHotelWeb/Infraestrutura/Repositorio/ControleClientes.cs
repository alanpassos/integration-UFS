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
    public class ControleClientes : IControleClientes
    {
        private IQueryable<ControleCliente> controleClientes;
        private IProjectHotel unidadeTrabalho;

        private ControleClientes(IQueryable<ControleCliente> controleClientes, IProjectHotel unidadeTrabalho)
        {
            this.controleClientes = controleClientes;
            this.unidadeTrabalho = unidadeTrabalho;
        }
        public ControleClientes()
        {

            this.unidadeTrabalho = new ProjectHotel();
            this.controleClientes = unidadeTrabalho.ControleClientes;
        }

        public ControleClientes(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.ControleClientes, unidadeTrabalho) { }

        public void Cadastrar(ControleCliente controleCliente)
        {
            unidadeTrabalho.RegistrarNovo(controleCliente);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(ControleCliente controleCliente)
        {
            unidadeTrabalho.RegistrarAlterado(controleCliente);
            unidadeTrabalho.Salvar();
        }

        public void Remover(ControleCliente controleCliente)
        {
            unidadeTrabalho.RegistrarRemovido(controleCliente);
            unidadeTrabalho.Salvar();
        }

        public ControleCliente ResultadoUnico(int idControleCliente, int idHospedagem)
        {
            return controleClientes.SingleOrDefault(c => c.idCliente == idControleCliente && c.idHospedagem == idHospedagem );
        }

        public ControleCliente ResultadoUnicoHospedagem(int idHospedagem)
        {
            return controleClientes.SingleOrDefault(c => c.idHospedagem == idHospedagem);
        }

        public ICollection<ControleCliente> Listar()
        {
            return controleClientes.OrderBy(p => p.idHospedagem).ToList();
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
