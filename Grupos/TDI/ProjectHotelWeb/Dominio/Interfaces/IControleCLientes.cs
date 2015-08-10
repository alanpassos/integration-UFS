using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IControleClientes : IRepositorio<ControleCliente>
    {
        void Cadastrar(ControleCliente controleCliente);
        void Atualizar(ControleCliente controleCLiente);
        void Remover(ControleCliente controleCliente);
        ControleCliente ResultadoUnico(int idCliente);
        ControleCliente ResultadoUnicoHospedagem(int idHospedagem);
    }
}
