using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IItens : IRepositorio<Item>
    {
        int Cadastrar(Item item);
        int CadastrarNovo(Item item);
        void Atualizar(Item item);
        void Remover(Item item);
        Item ResultadoUnico(int idItem);
        Item ResultadoUnicoHospedagem(int idHospedagem, int idProduto);
        ICollection<Item> ListarItemPorHspedagem(int idHospedagem);

    }
}
