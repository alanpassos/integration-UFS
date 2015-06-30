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
    
    public partial class Pessoa
    {
        public Pessoa()
        {
            this.ControleCliente = new HashSet<ControleCliente>();
            this.Usuario = new HashSet<Usuario>();
            this.ControleServico = new HashSet<ControleServico>();
        }
    
        public int idPessoa { get; set; }
        public Nullable<int> idCargo { get; set; }
        public string nome { get; set; }
        public string cpfCnpj { get; set; }
        public string rg { get; set; }
        public System.DateTime dataNascimento { get; set; }
        public string estadoCivil { get; set; }
        public string telefoneFixo { get; set; }
        public string telefoneMovel { get; set; }
        public string emailPimario { get; set; }
        public string emailSecundario { get; set; }
        public Nullable<decimal> salario { get; set; }
        public string bairro { get; set; }
        public string cidade { get; set; }
        public string rua { get; set; }
        public int numero { get; set; }
        public string cep { get; set; }
        public System.DateTime dataCadastro { get; set; }
        public bool ativo { get; set; }
        public bool isFuncionario { get; set; }
    
        public virtual Cargo Cargo { get; set; }
        public virtual ICollection<ControleCliente> ControleCliente { get; set; }
        public virtual ICollection<Usuario> Usuario { get; set; }
        public virtual ICollection<ControleServico> ControleServico { get; set; }
    }
}
