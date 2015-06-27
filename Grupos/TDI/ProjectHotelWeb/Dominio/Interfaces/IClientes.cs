
using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IClientes : IRepositorio<Cliente>
    {
        void Cadastrar(Cliente cliente);
        void Atualizar(Cliente cliente);
        void Remover(Cliente cliente);
        Cliente ResultadoUnico(int idCliente);


    }
}
