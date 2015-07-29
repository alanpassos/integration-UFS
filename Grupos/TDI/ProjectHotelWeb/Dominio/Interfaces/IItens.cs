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
        void Cadastrar(Item item);
        void Atualizar(Item item);
        void Remover(Item item);
        Item ResultadoUnico(int idItem);
        ICollection<Item> ListarItemPorHspedagem(int idHospedagem);

    }
}
