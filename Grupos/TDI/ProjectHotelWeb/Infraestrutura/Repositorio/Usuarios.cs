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
    public class Usuarios : IUsuarios
    {
        private IQueryable<Usuario> usuarios;
        private IProjectHotel unidadeTrabalho;

        private Usuarios(IQueryable<Usuario> Usuarios, IProjectHotel unidadeTrabalho)
        {
            this.usuarios = Usuarios;
            this.unidadeTrabalho = unidadeTrabalho;
        }

        public Usuarios(IProjectHotel iHotelWeb, IProjectHotel unidadeTrabalho) :
            this(iHotelWeb.Usuarios, unidadeTrabalho) { }

        public void Cadastrar(Usuario Usuario)
        {
            unidadeTrabalho.RegistrarNovo(Usuario);
            unidadeTrabalho.Salvar();
        }

        public void Atualizar(Usuario Usuario)
        {
            unidadeTrabalho.RegistrarAlterado(Usuario);
            unidadeTrabalho.Salvar();
        }

        public void Remover(Usuario Usuario)
        {
            unidadeTrabalho.RegistrarRemovido(Usuario);
            unidadeTrabalho.Salvar();
        }

        public Usuario ResultadoUnico(int idUsuario)
        {
            return usuarios.SingleOrDefault(c => c.idUsuario == idUsuario);
        }

        public ICollection<Usuario> Listar()
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
