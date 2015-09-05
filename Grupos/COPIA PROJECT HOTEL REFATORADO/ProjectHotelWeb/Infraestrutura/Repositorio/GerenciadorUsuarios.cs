using Dominio.Classes;
using Dominio.Interfaces;
using Infraestrutura.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestrutura.Repositorio
{
    public class GerenciadorUsuarios : IGerenciadorUsuarios
    {
        private IQueryable<UsuarioModel> usuarios;
        private IProjectHotel unidadeTrabalho;

        private GerenciadorUsuarios(IQueryable<UsuarioModel> Usuarios, IProjectHotel unidadeTrabalho)
        {
            this.usuarios = Usuarios;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public GerenciadorUsuarios(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Usuarios, unidadeTrabalho) { }

        public void Cadastrar(UsuarioModel Usuario)
        {
            unidadeTrabalho.RegistrarNovo(Usuario);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(UsuarioModel Usuario)
        {
            unidadeTrabalho.RegistrarAlterado(Usuario);
            unidadeTrabalho.Salvar();
        }

        public void Remover(UsuarioModel Usuario)
        {
            unidadeTrabalho.RegistrarRemovido(Usuario);
            unidadeTrabalho.Salvar();
        }

        public UsuarioModel ResultadoUnico(int idUsuario)
        {
            return usuarios.SingleOrDefault(c => c.idUsuario == idUsuario);
        }

        public ICollection<UsuarioModel> Listar()
        {
            return usuarios.OrderBy(p => p.nome).ToList();
        }

        public bool ContemRegistro()
        {
            throw new NotImplementedException();
        }

        public int TotalRegistros()
        {
            throw new NotImplementedException();
        }
    }
}
