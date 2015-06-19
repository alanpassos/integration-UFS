using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
public    class Cargo
    {

    public int idCargo { get; set; }
    public string descricao { get; set; }
    public string observacao { get; set; }
    public bool ativo { get; set; }

    public virtual Pessoa pessoa { get; set; }
    }
}
