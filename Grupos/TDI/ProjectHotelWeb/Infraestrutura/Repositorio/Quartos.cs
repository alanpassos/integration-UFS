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
    public class Quartos : IQuartos
    {
        private IQueryable<Quarto> quartos;
        private IProjectHotel unidadeTrabalho;

        private Quartos(IQueryable<Quarto> Quartos, IProjectHotel unidadeTrabalho)
        {
            this.quartos = Quartos;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Quartos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Quartos, unidadeTrabalho) { }

        public void Cadastrar(Quarto Quarto)
        {
            unidadeTrabalho.RegistrarNovo(Quarto);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Quarto Quarto)
        {
            unidadeTrabalho.RegistrarAlterado(Quarto);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Quarto Quarto)
        {
            unidadeTrabalho.RegistrarRemovido(Quarto);
            unidadeTrabalho.Salvar();
        }

        public Quarto ResultadoUnico(int idQuarto)
        {
            return quartos.SingleOrDefault(c => c.idQuarto == idQuarto);
        }

        public ICollection<Quarto> Listar()
        {
            return quartos.OrderBy(p => p.descricao).ToList();
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
