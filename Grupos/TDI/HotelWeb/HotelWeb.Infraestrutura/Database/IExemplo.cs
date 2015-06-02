using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HotelWeb.Dominio.Classes;
using HotelWeb.Dominio.Interfaces;
using System.Data.Entity;

namespace HotelWeb.Infraestrutura.Database
{
    public interface IExemplo : IUnidadeTrabalho
    {
        DbSet<Pessoa> Pessoas { get; }
    }
}
