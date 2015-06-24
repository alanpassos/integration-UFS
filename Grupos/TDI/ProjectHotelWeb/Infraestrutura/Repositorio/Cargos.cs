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
    public class Cargos : ICargos
    {
        private IQueryable<Cargo> cargos;
        private IProjectHotel unidadeTrabalho;

        private Cargos(IQueryable<Cargo> Cargos, IProjectHotel unidadeTrabalho)
        {
            this.cargos = Cargos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Cargos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Cargos, unidadeTrabalho) { }

        public void Cadastrar(Cargo Cargo)
        {
            unidadeTrabalho.RegistrarNovo(Cargo);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Cargo Cargo)
        {
            unidadeTrabalho.RegistrarAlterado(Cargo);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Cargo Cargo)
        {
            unidadeTrabalho.RegistrarRemovido(Cargo);
            unidadeTrabalho.Salvar();
        }

        public Cargo ResultadoUnico(int idCargo)
        {
            return cargos.SingleOrDefault(c => c.idCargo == idCargo);
        }

        public ICollection<Cargo> Listar()
        {
            return cargos.OrderBy(p => p.descricao).ToList();
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
