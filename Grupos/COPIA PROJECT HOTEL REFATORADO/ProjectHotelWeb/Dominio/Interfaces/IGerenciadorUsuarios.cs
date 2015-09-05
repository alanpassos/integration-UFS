using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IGerenciadorUsuarios : IRepositorio<UsuarioModel>
    {
        void Cadastrar(UsuarioModel usuario);
        void Atualizar(UsuarioModel usuario);
        void Remover(UsuarioModel usuario);
        UsuarioModel ResultadoUnico(int idUsuario);
    }
}
