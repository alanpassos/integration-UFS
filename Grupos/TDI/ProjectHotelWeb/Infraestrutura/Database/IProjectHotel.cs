
using Dominio.Classes;
using Dominio.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Database
{
    public interface IProjectHotel : IUnidadeTrabalho
    {
        DbSet<Pessoa> Funcionarios { get; }
        DbSet<Pessoa> Clientes { get; set; }
        DbSet<Servico> Servicos { get; }
        DbSet<ControleServico> ControleServicos { get; }

        DbSet<Produto> Produtos { get; }
        DbSet<Historico> Historicos { get; }
        DbSet<Cargo> Cargos { get; }

        DbSet<Hospedagem> Hospedagens { get; }
        DbSet<ControleCliente> ControleClientes { get;  }
        DbSet<Usuario> Usuarios { get; }

        DbSet<Pagamento> Pagamentos { get; }
        DbSet<Quarto> Quartos { get; }
        DbSet<FormaPagamento> FormaPagamentos { get; }

        DbSet<TipoQuarto> TipoQuartos { get; }
        DbSet<Item> Itens { get; }
        DbSet<HistoricoAcesso> HistoricoAcessos { get; }

        DbSet<PacoteHospedagem> PacoteHospedagens { get;  }
    }
}
