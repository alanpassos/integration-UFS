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
    public class PacoteHospedagens : IPacoteHospedagens
    {
        private IQueryable<PacoteHospedagem> pacoteHospedagens;
        private IProjectHotel unidadeTrabalho;

        private PacoteHospedagens(IQueryable<PacoteHospedagem> pacoteHospedagens, IProjectHotel unidadeTrabalho)
        {
            this.pacoteHospedagens = pacoteHospedagens;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public PacoteHospedagens(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.PacoteHospedagens, unidadeTrabalho) { }

        public void Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            unidadeTrabalho.RegistrarNovo(pacoteHospedagem);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(PacoteHospedagem pacoteHospedagem)
        {
            unidadeTrabalho.RegistrarAlterado(pacoteHospedagem);
            unidadeTrabalho.Salvar();
        }

        public void Remover(PacoteHospedagem pacoteHospedagem)
        {
            unidadeTrabalho.RegistrarRemovido(pacoteHospedagem);
            unidadeTrabalho.Salvar();
        }

        public PacoteHospedagem ResultadoUnico(int id)
        {
            return pacoteHospedagens.SingleOrDefault(c => c.idPacoteHospedagem == id);
        }

        public PacoteHospedagem ResultadoUnicoReserva(int idReserva)
        {
            return pacoteHospedagens.SingleOrDefault(c => c.idPacoteHospedagem == idReserva && c.tipoPacote.Equals("R"));
        }

        public PacoteHospedagem ResultadoUnicoCheckin(int idReserva)
        {
            return pacoteHospedagens.SingleOrDefault(c => c.idPacoteHospedagem == idReserva && c.tipoPacote.Equals("C"));
        }

        public PacoteHospedagem ResultadoUnicoCheckout(int idReserva)
        {
            return pacoteHospedagens.SingleOrDefault(c => c.idPacoteHospedagem == idReserva && c.tipoPacote.Equals("K"));
        }

        public ICollection<PacoteHospedagem> Listar()
        {
            return pacoteHospedagens.OrderBy(p => p.tipoPacote).ToList();
        }

        public ICollection<PacoteHospedagem> ListarReserva()
        {
            return pacoteHospedagens.Where(p => p.tipoPacote.Equals("R") && p.ativo == true).OrderBy(p => p.tipoPacote).ToList();
        }

        public ICollection<PacoteHospedagem> ListarCheckin()
        {
            return pacoteHospedagens.Where(p => p.tipoPacote.Equals("C") && p.ativo == true).OrderBy(p => p.tipoPacote).ToList();
        }

        public ICollection<PacoteHospedagem> ListarCheckout()
        {
            return pacoteHospedagens.Where(p => p.tipoPacote.Equals("K") && p.ativo == true).OrderBy(p => p.tipoPacote).ToList();
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
