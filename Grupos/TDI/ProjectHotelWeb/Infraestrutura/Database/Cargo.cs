//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Infraestrutura.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cargo
    {
        public Cargo()
        {
            this.Pessoa = new HashSet<Pessoa>();
        }
    
        public int idCargo { get; set; }
        public string descricao { get; set; }
        public string observacao { get; set; }
        public bool ativo { get; set; }
    
        public virtual ICollection<Pessoa> Pessoa { get; set; }
    }
}
