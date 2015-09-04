using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IProdutos : IRepositorio<ProdutoModel>
    {
        void Cadastrar(ProdutoModel produto);
        void Atualizar(ProdutoModel produto);
        void Remover(ProdutoModel produto);
        ProdutoModel ResultadoUnico(int idProduto);
    }
}
