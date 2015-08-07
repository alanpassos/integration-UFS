using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Classes
{
public    class Cargo
    {

    public int idCargo { get; set; }
    [Required]
    public string descricao { get; set; }
    public string observacao { get; set; }
    public bool ativo { get; set; }

    public virtual List<Pessoa> Pessoa { get; set; }
    }
}
