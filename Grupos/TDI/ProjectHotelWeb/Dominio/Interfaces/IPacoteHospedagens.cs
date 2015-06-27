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
        void Cadastrar(PacoteHospedagem pacoteHospedagem);
        void Atualizar(PacoteHospedagem pacoteHospedagem);
        void Remover(PacoteHospedagem pacoteHospedagem);
        ICollection<PacoteHospedagem> ListarReserva();
        PacoteHospedagem ResultadoUnico(int idPacoteHospedagem);
        PacoteHospedagem ResultadoUnicoReserva(int idReserva);

    }
}
