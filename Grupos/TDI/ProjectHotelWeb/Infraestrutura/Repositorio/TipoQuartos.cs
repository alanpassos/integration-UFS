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

        public ICollection<QuartosLivresReserva> ListaLivres(string tipoQuartoPesquisa, string pessoasPesquisa, DateTime dataInicio, DateTime dataFim)
        {
            List<QuartosLivresReserva> quartosLista = new List<QuartosLivresReserva>();

            IQueryable<QuartosLivresReserva> ConsultaPacoteHospedagem = from tipo_quarto in tipoQuartos
                                                                        join quarto in quartos on tipo_quarto.idTipoQuarto equals quarto.idTipoQuarto
                                                                        where quarto.status.Equals("L") && tipo_quarto.descricao.Equals(tipoQuartoPesquisa)
                                                                        && !quarto.reservado
                                                                        && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                                        && !(
                                                                            from _pacote_hospedagem in pacoteHospedagem
                                                                            join _hospedagem in hospedagem on _pacote_hospedagem.idPacoteHospedagem equals _hospedagem.idPacoteHospedagem
                                                                            join _quartos in quartos on _hospedagem.idQuarto equals _quartos.idQuarto
                                                                            join _tipo_quarto in tipoQuartos on _quartos.idTipoQuarto equals _tipo_quarto.idTipoQuarto
                                                                            where _quartos.idQuarto.Equals(quarto.idQuarto)
                                                                            && (dataInicio <= _pacote_hospedagem.dataSaida && dataFim >= _pacote_hospedagem.dataEntrada)
                                                                            && _pacote_hospedagem.tipoPacote.Equals("R")
                                                                            select _quartos.idQuarto
                                                                        ).Contains(quarto.idQuarto)
                                                                        group tipo_quarto by new
                                                                        {
                                                                            tipo_quarto.idTipoQuarto,
                                                                            tipo_quarto.descricao,
                                                                            quarto.capacidade,
                                                                            tipo_quarto.valor,
                                                                            dataFim,
                                                                            dataInicio

                                                                        } into quartoLivre
                                                                        select new QuartosLivresReserva
                                                                        {
                                                                            idTipoQuarto = quartoLivre.Key.idTipoQuarto,
                                                                            descricao = quartoLivre.Key.descricao,
                                                                            capacidade = quartoLivre.Key.capacidade,
                                                                            valor = quartoLivre.Key.valor,
                                                                            quantidade = quartoLivre.Count(),
                                                                            dataFim = dataFim,
                                                                            dataInicio = dataInicio
                                                                        };


            quartosLista = ConsultaPacoteHospedagem.OrderBy(p => p.descricao).ToList();

            return quartosLista;
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

        public ICollection<QuartosLivresReserva> ListaTiposReservadosCliente(int idCliente)
        {
            List<QuartosLivresReserva> quartosReservados = new List<QuartosLivresReserva>();

            IQueryable<QuartosLivresReserva> consultaReservasCliente = from _hospedagem in hospedagem
                                                                       join _cliente in cliente on _hospedagem.idHospedagem equals _cliente.idHospedagem
                                                                       join quarto in quartos on _hospedagem.idQuarto equals quarto.idQuarto
                                                                       join tipo_quarto in tipoQuartos on quarto.idTipoQuarto equals tipo_quarto.idTipoQuarto
                                                                       where quarto.reservado && _cliente.idCliente == idCliente
                                                                       select new QuartosLivresReserva
                                                                       {
                                                                           idTipoQuarto = tipo_quarto.idTipoQuarto,
                                                                           descricao = tipo_quarto.descricao,
                                                                           capacidade = quarto.capacidade,
                                                                           valor = _hospedagem.valorHospedagem,
                                                                           dataFim = _hospedagem.dataLiberacao,
                                                                           dataInicio = _hospedagem.dataAbertura
                                                                       };

            quartosReservados = consultaReservasCliente.ToList();

            return quartosReservados;
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
