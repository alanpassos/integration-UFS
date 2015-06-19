using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IUsuarios : IRepositorio<Usuario>
    {
        void Cadastrar(Usuario usuario);
        void Atualizar(Usuario usuario);
        void Remover(Usuario usuario);
        Usuario ResultadoUnico(int idUsuario);
    }
}
