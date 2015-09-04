using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using Dominio.Classes_Especiais;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Data.Entity;

namespace Infraestrutura.Repositorio
{
    public class Hospedagens : IHospedagens
    {
        private IQueryable<Hospedagem> hospedagens;
        private IProjectHotel unidadeTrabalho;
        private IQueryable<Quarto> quartos;
        private IQueryable<TipoQuarto> tipoQuartos;
        private IQueryable<ControleCliente> controleClientes;
        private IQueryable<Pessoa> clientes;
        private IQueryable<PacoteHospedagem> pacoteHospedagens;

        public Hospedagens()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.hospedagens = unidadeTrabalho.Hospedagens;
        }

        private Hospedagens(IQueryable<Hospedagem> hospedagens, IProjectHotel unidadeTrabalho)
        {
            this.hospedagens = hospedagens;
            this.unidadeTrabalho = unidadeTrabalho;
            tipoQuartos = unidadeTrabalho.TipoQuartos;
            quartos = unidadeTrabalho.Quartos;
            hospedagens = unidadeTrabalho.Hospedagens;
            controleClientes = unidadeTrabalho.ControleClientes;
            clientes = unidadeTrabalho.Clientes;
            pacoteHospedagens = unidadeTrabalho.PacoteHospedagens;
        }
        public Hospedagens()
        {
            this.unidadeTrabalho = new ProjectHotel();
            this.hospedagens = unidadeTrabalho.Hospedagens;
            
        }

        public Hospedagens(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Hospedagens, unidadeTrabalho) { }

        public int Cadastrar(Hospedagem hospedagem)
        {
            unidadeTrabalho.RegistrarNovo(hospedagem);
            unidadeTrabalho.Salvar();
            return hospedagens.Max(h => h.idHospedagem);
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
            return hospedagens.OrderBy(p => p.dataAbertura).ToList();
        }

        public ICollection<HospedagemMes> RelatorioHospedagemMes()
        {
            List<HospedagemMes> listaHospedagem = new List<HospedagemMes>();
            CultureInfo culture = new CultureInfo("pt-BR");
            IQueryable<HospedagemMes> ConsultaHospedagemMes = from hospedagem in hospedagens
                                                              join controleCliente in controleClientes on hospedagem.idHospedagem equals controleCliente.idHospedagem
                                                              join pessoa in clientes on controleCliente.idCliente equals pessoa.idPessoa
                                                              join pacoteHospedagem in pacoteHospedagens on hospedagem.idPacoteHospedagem equals pacoteHospedagem.idPacoteHospedagem
                                                              where hospedagem.dataAbertura.Month <= DateTime.Now.Month
                                                                && pacoteHospedagem.tipoPacote.Equals("C")
                                                                group hospedagem by new
                                                                {
                                                                    pessoa.nome,
                                                                    hospedagem.dataAbertura,
                                                                    pessoa.cpfCnpj,
                                                                    hospedagem.valorHospedagem,
                                                                    pessoa.telefoneMovel,
                                                                    mes = hospedagem.dataAbertura.Month
                                                                    
                                                                } into hospedagemMes
                                                              select new HospedagemMes
                                                              {
                                                                  nome = hospedagemMes.Key.nome,
                                                                  cpfcnpj = hospedagemMes.Key.cpfCnpj,
                                                                  telefonemovel = hospedagemMes.Key.telefoneMovel,
                                                                  hospedagens = hospedagemMes.Count(),
                                                                  mes = (hospedagemMes.Key.mes).ToString(),
                                                                  valorTotal = hospedagemMes.Sum(p => p.valorHospedagem)
                                                              };

            var _listaHospedagem = ConsultaHospedagemMes.ToList().Select(c => new HospedagemMes
                {
                    nome = c.nome,
                    cpfcnpj = c.cpfcnpj,
                    telefonemovel = c.telefonemovel,
                    hospedagens = c.hospedagens,
                    mes = culture.DateTimeFormat.GetMonthName(Convert.ToInt32(c.mes)).ToString().ToUpper(),
                    valorTotal = c.valorTotal
                });
            listaHospedagem = _listaHospedagem.ToList();

            return listaHospedagem;
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
