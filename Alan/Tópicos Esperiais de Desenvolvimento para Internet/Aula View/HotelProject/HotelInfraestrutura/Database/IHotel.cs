using HotelDominio.Classes;
using HotelDominio.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelInfraestrutura.Database
{
  public  interface IHotel : IUnidadeTrabalho
    {
        DbSet<Pessoa> Pessoas { get; }
    }
}
