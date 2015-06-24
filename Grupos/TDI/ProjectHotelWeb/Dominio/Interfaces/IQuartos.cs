using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IQuartos : IRepositorio<Quarto>
    {
        void Cadastrar(Quarto quarto);
        void Atualizar(Quarto quarto);
        void Remover(Quarto quarto);
        Quarto ResultadoUnico(int idQuarto);
    }
}
