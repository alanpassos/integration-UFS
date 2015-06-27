using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IFuncionarios : IRepositorio<Funcionario>
    {
        void Cadastrar(Funcionario funcionario);
        void Atualizar(Funcionario funcionario);
        void Remover(Funcionario funcionario);
        Funcionario ResultadoUnico(int idFuncionario);
        
        
    }
}
