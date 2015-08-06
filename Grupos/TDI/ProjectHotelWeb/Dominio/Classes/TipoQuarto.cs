using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class TipoQuarto
    {
        public int idTipoQuarto { get; set; }
        public int? idPacoteHospedagem { get; set; }
        public string descricao { get; set; }
        public string observacao { get; set; }
        public decimal valor { get; set; }

        public virtual List<Quarto> Quarto { get; set; }
        public virtual PacoteHospedagem PacoteHospedagem { get; set; }
    }
}
