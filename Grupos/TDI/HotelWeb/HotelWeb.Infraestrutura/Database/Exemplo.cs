using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using HotelWeb.Dominio.Classes;

namespace HotelWeb.Infraestrutura.Database
{
    public class Exemplo : UnidadeTrabalho, IExemplo
    {
        public Exemplo()
            : base("name=HotelWebBDEntities")
        {

        }
        public DbSet<Pessoa> Pessoas { get; set; }
    }
}
