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
    public class Hospedagens : IHospedagens
    {
        private IQueryable<Hospedagem> hospedagens;
        private IProjectHotel unidadeTrabalho;

        private Hospedagens(IQueryable<Hospedagem> hospedagens, IProjectHotel unidadeTrabalho)
        {
            this.hospedagens = hospedagens;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Hospedagens(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Hospedagens, unidadeTrabalho) { }

        public void Cadastrar(Hospedagem hospedagem)
        {
            unidadeTrabalho.RegistrarNovo(hospedagem);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Hospedagem hospedagem)
        {
            unidadeTrabalho.RegistrarAlterado(hospedagem);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Hospedagem hospedagem)
        {
            unidadeTrabalho.RegistrarRemovido(hospedagem);
            unidadeTrabalho.Salvar();
        }

        public Hospedagem ResultadoUnico(int idHospedagem)
        {
            return hospedagens.SingleOrDefault(c => c.idHospedagem == idHospedagem);
        }

        public ICollection<Hospedagem> Listar()
        {
            return hospedagens.OrderBy(p => p.dataLiberacao).ToList();
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
