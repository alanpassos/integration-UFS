using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface ICargos : IRepositorio<Cargo>
    {
        void Cadastrar(Cargo cargo);
        void Atualizar(Cargo cargo);
        void Remover(Cargo cargo);
        Cargo ResultadoUnico(int idCargo);
    }
}
