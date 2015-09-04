using Dominio.Classes;
using Dominio.Interfaces;
using Dominio.Classes_Especiais;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Repositorio
{
    public class TipoQuartos : ITipoQuartos
    {
        private IQueryable<TipoQuarto> tipoQuartos;
        private IProjectHotel unidadeTrabalho;
        private IQueryable<Quarto> quartos;
        private IQueryable<PacoteHospedagem> pacoteHospedagem;
        private IQueryable<Hospedagem> hospedagem;
        private IQueryable<ControleCliente> cliente;

        
        public TipoQuartos()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.tipoQuartos = unidadeTrabalho.TipoQuartos;
        }

        private TipoQuartos(IQueryable<TipoQuarto> TipoQuartos, IProjectHotel unidadeTrabalho)
        {
            this.tipoQuartos = TipoQuartos;
            this.unidadeTrabalho = unidadeTrabalho;
            quartos = unidadeTrabalho.Quartos;
            pacoteHospedagem = unidadeTrabalho.PacoteHospedagens;
            hospedagem = unidadeTrabalho.Hospedagens;
            cliente = unidadeTrabalho.ControleClientes;
        }

        public TipoQuartos(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.TipoQuartos, unidadeTrabalho) { }


        public void Cadastrar(TipoQuarto TipoQuarto)
        {
            unidadeTrabalho.RegistrarNovo(TipoQuarto);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(TipoQuarto TipoQuarto)
        {
            unidadeTrabalho.RegistrarAlterado(TipoQuarto);
            unidadeTrabalho.Salvar();
        }

        public void Remover(TipoQuarto TipoQuarto)
        {
            unidadeTrabalho.RegistrarRemovido(TipoQuarto);
            unidadeTrabalho.Salvar();
        }

        public TipoQuarto ResultadoUnico(int idTipoQuarto)
        {
            return tipoQuartos.SingleOrDefault(c => c.idTipoQuarto == idTipoQuarto);
        }

        public ICollection<TipoQuarto> Listar()
        {
            return tipoQuartos.OrderBy(p => p.descricao).ToList();
        }    

        public ICollection<int> ListaQuartosTipo(string idTipoQuartoPesquisa, string pessoasPesquisa)
        {
            List<int> indicesQuartos = new List<int>();

            IQueryable<int> consultaIdQuartosTipo = from tipo_quarto in tipoQuartos
                                                    join quarto in quartos on tipo_quarto.idTipoQuarto equals quarto.idTipoQuarto
                                                    where quarto.status.Equals("L") && tipo_quarto.idTipoQuarto.ToString().Equals(idTipoQuartoPesquisa)
                                                    && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                    select quarto.idQuarto;


            indicesQuartos = consultaIdQuartosTipo.ToList();

            return indicesQuartos;
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
