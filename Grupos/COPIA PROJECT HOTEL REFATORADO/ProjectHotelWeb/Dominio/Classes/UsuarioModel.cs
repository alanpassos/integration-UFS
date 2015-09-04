using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
   public class UsuarioModel
    {
       public int idUsuario { get; set; }
       public int idFuncionario { get; set; }
       public string nome { get; set; }
       public string senha { get; set; }
       public DateTime dataCadastro { get; set; }
       public bool ativo { get; set; }
       public string nivelAcesso { get; set; }


       public virtual List<HistoricoModel> Historico { get; set; }
       public virtual List<HistoricoAcessoModel> HistoricoAcesso { get; set; }
       public virtual PessoaModel Pessoa { get; set; }

       

    }
}
