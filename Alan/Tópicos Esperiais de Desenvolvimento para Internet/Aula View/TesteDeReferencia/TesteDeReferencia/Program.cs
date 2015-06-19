using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TesteDeReferencia
{
    class Program
    {
        static void Main(string[] args)
        {
            
            Referencia referencia = new Referencia();

            string numero_ref = (string) referencia.numero;    



        }
    }

    public class Referencia
    {

        public int numero { get; set; }
        public string nome { get; set; }



    }
}
