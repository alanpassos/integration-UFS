using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelWeb.Dominio.Classes
{
    public class Pessoa
    {
        public int idPessoa { get; set; }
        public int idCargo { get; set; }
        public string nome { get; set; }
        public string cpfCnpj { get; set; }
        public string rg { get; set; }
        public DateTime dataNascimento { get; set; }
        public string estadoCivil { get; set; }
        public string telefoneFixo { get; set; }
        public string telefoneMovel { get; set; }
        public string emailPimario { get; set; }
        public string emailSecundario { get; set; }
        public decimal salario { get; set; }
        public string bairro { get; set; }
        public string cidade { get; set; }
        public string rua { get; set; }
        public int numero { get; set; }
        public string cep { get; set; }
        public DateTime dataCadastro { get; set; }
        public bool ativo { get; set; }
        public bool isFuncionario { get; set; }

        
    }
}
