using HotelDominio.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelInfraestrutura.Database
{
   public class Hotel: UnidadeTrabalho, IHotel
    {
        public Hotel()
           : base("name=HotelEntities")
        {

        }
        public DbSet<Pessoa> Pessoas { get; set; }
    }
}
