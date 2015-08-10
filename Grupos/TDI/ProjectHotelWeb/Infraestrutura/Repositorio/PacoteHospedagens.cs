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
    public class PacoteHospedagens : IPacoteHospedagens
    {
        private IQueryable<PacoteHospedagem> pacoteHospedagens;
        private IProjectHotel unidadeTrabalho;
        private IQueryable<Quarto> quartos;
        private IQueryable<Hospedagem> hospedagens;
        private IQueryable<TipoQuarto> tipoQuartos;
        private IQueryable<ControleCliente> controleClientes;
        private IQueryable<Pessoa> clientes;

        private PacoteHospedagens(IQueryable<PacoteHospedagem> pacoteHospedagens, IProjectHotel unidadeTrabalho)
        {
            this.pacoteHospedagens = pacoteHospedagens;
            this.unidadeTrabalho = unidadeTrabalho;
            tipoQuartos = unidadeTrabalho.TipoQuartos;
            quartos = unidadeTrabalho.Quartos;
            hospedagens = unidadeTrabalho.Hospedagens;
            controleClientes = unidadeTrabalho.ControleClientes;
            clientes = unidadeTrabalho.Clientes;
        }

        public PacoteHospedagens(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.PacoteHospedagens, unidadeTrabalho) { }

        public int Cadastrar(PacoteHospedagem pacoteHospedagem)
        {
            unidadeTrabalho.RegistrarNovo(pacoteHospedagem);
            unidadeTrabalho.Salvar();

            return pacoteHospedagens.Max(p => p.idPacoteHospedagem);
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

        public ICollection<PacoteHospedagem> ListarReservaPorCliente(string nomeCliente)
        {
            List<PacoteHospedagem> listaReservas = pacoteHospedagens.Where(p => p.tipoPacote.Equals("R") && p.ativo == true).ToList();
            string data = listaReservas[0].dataSaida.ToString().Replace("/", "").Substring(0, 8);
            return listaReservas.Where(p => p.Hospedagem[0].ControleCliente[0].Pessoa.nome.ToUpper().Contains(nomeCliente.ToUpper())).ToList(); 
        }

        public ICollection<PacoteHospedagem> ListarReservaPorCpf(string cpfCliente)
        {
            List<PacoteHospedagem> listaReservas = pacoteHospedagens.Where(p => p.tipoPacote.Equals("R") && p.ativo == true).ToList();
            return listaReservas.Where(p => p.Hospedagem[0].ControleCliente[0].Pessoa.cpfCnpj.ToUpper().Contains(cpfCliente.ToUpper())).ToList();
        }

        public ICollection<PacoteHospedagem> ListarReservaPorDataInicio(string dataInicio)
        {
            List<PacoteHospedagem> listaReservas = pacoteHospedagens.Where(p => p.tipoPacote.Equals("R") && p.ativo == true).ToList();
            return listaReservas.Where(p => p.dataEntrada.ToString().Substring(0, 10).Contains(dataInicio)).ToList();
        }

        public ICollection<PacoteHospedagem> ListarReservaPorDataFim(string dataFim)
        {
            List<PacoteHospedagem> listaReservas = pacoteHospedagens.Where(p => p.tipoPacote.Equals("R") && p.ativo == true).ToList();
            return listaReservas.Where(p => p.dataSaida.ToString().Substring(0, 10).Contains(dataFim)).ToList();
        }

        public ICollection<QuartosLivresReserva> ListaLivres(string tipoQuartoPesquisa, string pessoasPesquisa, DateTime dataInicio, DateTime dataFim)
        {
            List<QuartosLivresReserva> quartosLista = new List<QuartosLivresReserva>();

            IQueryable<QuartosLivresReserva> ConsultaPacoteHospedagem = from tipo_quarto in tipoQuartos
                                                                        join quarto in quartos on tipo_quarto.idTipoQuarto equals quarto.idTipoQuarto
                                                                        where quarto.status.Equals("L") && tipo_quarto.descricao.Equals(tipoQuartoPesquisa)
                                                                        && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                                        && !(
                                                                            from _pacote_hospedagem in pacoteHospedagens
                                                                            join _hospedagem in hospedagens on _pacote_hospedagem.idPacoteHospedagem equals _hospedagem.idPacoteHospedagem
                                                                            join _quartos in quartos on _hospedagem.idQuarto equals _quartos.idQuarto
                                                                            join _tipo_quarto in tipoQuartos on _quartos.idTipoQuarto equals _tipo_quarto.idTipoQuarto
                                                                            where _quartos.idQuarto.Equals(quarto.idQuarto)
                                                                            && (dataInicio <= _pacote_hospedagem.dataSaida && dataFim >= _pacote_hospedagem.dataEntrada)
                                                                            && _pacote_hospedagem.tipoPacote.Equals("R")
                                                                            && _quartos.reservado
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

        public ICollection<QuartosLivresReserva> ListaTiposReservadosPacote(int idPacoteHospedagem)
        {
            List<QuartosLivresReserva> quartosReservados = new List<QuartosLivresReserva>();

            IQueryable<QuartosLivresReserva> consultaReservasCliente = from _hospedagem in hospedagens
                                                                       join pacote_hospedagem in pacoteHospedagens on _hospedagem.idPacoteHospedagem equals pacote_hospedagem.idPacoteHospedagem
                                                                       join quarto in quartos on _hospedagem.idQuarto equals quarto.idQuarto
                                                                       join tipo_quarto in tipoQuartos on quarto.idTipoQuarto equals tipo_quarto.idTipoQuarto
                                                                       where quarto.reservado && pacote_hospedagem.idPacoteHospedagem == idPacoteHospedagem
                                                                       select new QuartosLivresReserva
                                                                       {
                                                                           idTipoQuarto = tipo_quarto.idTipoQuarto,
                                                                           descricao = tipo_quarto.descricao,
                                                                           capacidade = quarto.capacidade,
                                                                           valor = _hospedagem.valorHospedagem,
                                                                           valorTotal = pacote_hospedagem.valorTotal,
                                                                           dataFim = _hospedagem.dataLiberacao,
                                                                           dataInicio = _hospedagem.dataAbertura
                                                                       };

            quartosReservados = consultaReservasCliente.ToList();

            return quartosReservados;
        }

        public ICollection<QuartosLivresReserva> ConsultaPeriodo(string tipoQuartoPesquisa, string pessoasPesquisa, DateTime dataInicio, DateTime dataFim)
        {
            List<QuartosLivresReserva> quartosLista = new List<QuartosLivresReserva>();

            IQueryable<QuartosLivresReserva> ConsultaPacoteHospedagem = from pacoteHospedagem in pacoteHospedagens
                                                                        join hospedagem in hospedagens on pacoteHospedagem.idPacoteHospedagem equals hospedagem.idPacoteHospedagem
                                                                        join quarto in quartos on hospedagem.idQuarto equals quarto.idQuarto
                                                                        join tipoQuarto in tipoQuartos on quarto.idTipoQuarto equals tipoQuarto.idTipoQuarto
                                                                        where pacoteHospedagem.tipoPacote.Equals("R") && tipoQuarto.descricao.Equals(tipoQuartoPesquisa)
                                                                            && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                                        select new QuartosLivresReserva
                                                                        {
                                                                            idTipoQuarto = tipoQuarto.idTipoQuarto,
                                                                            descricao = tipoQuarto.descricao,
                                                                            capacidade = quarto.capacidade,
                                                                            valor = tipoQuarto.valor,
                                                                            dataFim = pacoteHospedagem.dataSaida,
                                                                            dataInicio = pacoteHospedagem.dataEntrada
                                                                        };


            quartosLista = ConsultaPacoteHospedagem.OrderBy(p => p.descricao).ToList();

            return quartosLista;
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
