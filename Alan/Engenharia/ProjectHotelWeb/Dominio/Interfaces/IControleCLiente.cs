using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IControleCLiente : IRepositorio<ControleCliente>
    {
        void Cadastrar(ControleCliente controleCliente);
        void Atualizar(ControleCliente controleCLiente);
        void Remover(ControleCliente controleCliente);
        ControleCliente ResultadoUnico(int idCliente);
    }
}
