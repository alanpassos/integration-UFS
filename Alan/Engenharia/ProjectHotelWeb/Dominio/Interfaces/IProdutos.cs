using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IProdutos : IRepositorio<Produto>
    {
        void Cadastrar(Produto produto);
        void Atualizar(Produto produto);
        void Remover(Produto produto);
        Produto ResultadoUnico(int idProduto);
    }
}
