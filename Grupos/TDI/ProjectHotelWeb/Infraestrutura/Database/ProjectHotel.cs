
using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Database
{
  public  class ProjectHotel: UnidadeTrabalho, IProjectHotel
    {
      public ProjectHotel()


          : base("name=dbtdinewhotelEntities")

        {

        }
        public DbSet<Funcionario> Funcionarios { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Servico> Servicos { get; set; }
        public DbSet<ControleServico> ControleServicos { get; set; }

        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Historico> Historicos { get; set; }
        public DbSet<Cargo> Cargos { get; set; }

        public DbSet<Hospedagem> Hospedagens { get; set; }
        public DbSet<ControleCliente> ControleClientes { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }

        public DbSet<Pagamento> Pagamentos { get; set; }
        public DbSet<Quarto> Quartos { get; set; }
        public DbSet<FormaPagamento> FormaPagamentos { get; set; }

        public DbSet<TipoQuarto> TipoQuartos { get; set; }
        public DbSet<Item> Itens { get; set; }
        public DbSet<HistoricoAcesso> HistoricoAcessos { get; set; }

        public DbSet<PacoteHospedagem> PacoteHospedagens { get; set; }

    }
}
