using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IHospedagens : IRepositorio<Hospedagem>
    {
        int Cadastrar(Hospedagem hospedagem);
        void Atualizar(Hospedagem hospedagem);
        void Remover(Hospedagem hospedagem);
        Hospedagem ResultadoUnico(int idHospedagem);
    }
}
