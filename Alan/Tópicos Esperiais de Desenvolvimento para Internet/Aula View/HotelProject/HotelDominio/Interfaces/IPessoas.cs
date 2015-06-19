using HotelDominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDominio.Interfaces
{
    public interface IPessoas : IRepositorio<Pessoa>
    {
        void Cadastrar(Pessoa pessoa);

        void Atualizar(Pessoa pessoa);

        void Remover(Pessoa pessoa);

        Pessoa ResultadoUnico(int idPessoa);
    }
}
