using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
   public interface IPacoteHospedagens : IRepositorio<PacoteHospedagem>
    {
        int Cadastrar(PacoteHospedagem pacoteHospedagem);
        void Atualizar(PacoteHospedagem pacoteHospedagem);
        void Remover(PacoteHospedagem pacoteHospedagem);
        ICollection<PacoteHospedagem> ListarReserva();
        ICollection<PacoteHospedagem> ListarCheckin();
        ICollection<PacoteHospedagem> ListarCheckout();
        PacoteHospedagem ResultadoUnico(int idPacoteHospedagem);
        PacoteHospedagem ResultadoUnicoReserva(int idReserva);
        PacoteHospedagem ResultadoUnicoCheckin(int idReserva);
        PacoteHospedagem ResultadoUnicoCheckout(int idReserva);

    }
}
