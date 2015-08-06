using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
    public class PacoteHospedagem
    {

        public int idPacoteHospedagem { get; set; }
        public decimal valorTotal{ get; set; }
        public decimal subTotal{ get; set; }
        public string observacao { get; set; }
        public DateTime? dataLiberacao{ get; set; }
        public DateTime dataEntrada { get; set; }
        public DateTime? dataSaida{ get; set; }
        public DateTime dataCadastro{ get; set; }
        public bool ativo { get; set; }
        public string tipoPacote{ get; set; }
        

        public virtual List<HistoricoAcesso> HistoricoAcesso { get; set; }
        public virtual List<Hospedagem> Hospedagem { get; set; }
        public virtual List<Pagamento> Pagamento { get; set; }
        public virtual List<TipoQuarto> TipoQuarto { get; set; }
        public virtual List<ControleCliente> ControleCliente { get; set; }
        

    }
}
