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

        private TipoQuartos(IQueryable<TipoQuarto> TipoQuartos, IProjectHotel unidadeTrabalho)
        {
            this.tipoQuartos = TipoQuartos;
            this.unidadeTrabalho = unidadeTrabalho;
            quartos = unidadeTrabalho.Quartos;
            pacoteHospedagem = unidadeTrabalho.PacoteHospedagens;
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
            /*
            IQueryable<QuartosLivresReserva> Resultado = from tipo_quarto in tipoQuartos
                                                         join quarto in quartos on tipo_quarto.idTipoQuarto equals quarto.idTipoQuarto
                                                         where quarto.status.Equals("L") && tipo_quarto.descricao.Equals(tipoQuartoPesquisa)
                                                         && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                         group tipo_quarto by new {tipo_quarto.idTipoQuarto, tipo_quarto.descricao, 
                                                             quarto.idQuarto, quarto.capacidade, tipo_quarto.valor} into quartoLivre
                                                         select new QuartosLivresReserva
                                                         {
                                                             idTipoQuarto = quartoLivre.Key.idTipoQuarto,
                                                             idQuarto = quartoLivre.Key.idQuarto,
                                                             descricao = quartoLivre.Key.descricao,
                                                             capacidade = quartoLivre.Key.capacidade,
                                                             valor = quartoLivre.Key.valor,
                                                             quantidade = quartoLivre.Count()
            
                                                         };
            IQueryable<QuartosLivresReserva> ConsultaPacoteHospedagem = from tipo_quarto in tipoQuartos
                                                                        join quarto in quartos on tipo_quarto.idTipoQuarto equals quarto.idTipoQuarto
                                                                        join pacote_Hospedagem in pacoteHospedagem on tipo_quarto.idTipoQuarto equals pacote_Hospedagem.idTipoQuarto
                                                                        where tipo_quarto.descricao.Equals(tipoQuartoPesquisa)
                                                                        && quarto.capacidade.ToString().Equals(pessoasPesquisa)
                                                                        && (quarto.status.Equals("R") || quarto.status.Equals("L"))
                                                                        && (dataInicio >= pacote_Hospedagem.dataSaida || dataFim <= pacote_Hospedagem.dataEntrada)
                                                                        && pacote_Hospedagem.tipoPacote.Equals("R")
                                                                        && pacote_Hospedagem.ativo
                                                                        group tipo_quarto.idTipoQuarto by new { tipo_quarto.idTipoQuarto, tipo_quarto.descricao, quarto.capacidade, tipo_quarto.valor,
                                                                            pacote_Hospedagem.dataEntrada, pacote_Hospedagem.dataSaida, quarto.idQuarto } into quartoLivre
                                                                        select new QuartosLivresReserva
                                                                        {
                                                                            idTipoQuarto = quartoLivre.Key.idTipoQuarto,
                                                                            idQuarto = quartoLivre.Key.idQuarto,
                                                                            descricao = quartoLivre.Key.descricao,
                                                                            capacidade = quartoLivre.Key.capacidade,
                                                                            valor = quartoLivre.Key.valor,
                                                                            quantidade = quartoLivre.Count(),
                                                                            dataInicio = quartoLivre.Key.dataEntrada,
                                                                            dataFim = quartoLivre.Key.dataSaida
                                                                        };
            
            quartosLista = ConsultaPacoteHospedagem.OrderBy(p => p.descricao).ToList();
          */
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
