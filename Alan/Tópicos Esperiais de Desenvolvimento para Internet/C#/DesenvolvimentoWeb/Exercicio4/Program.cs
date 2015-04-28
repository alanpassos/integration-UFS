using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio4
{
    class Program
    {
        static void Main(string[] args)
        {
            Circulo circulo = new Circulo();

            circulo.InsertData();

            PrintData(circulo);

            Console.ReadKey();



        }

        private static void PrintData(Circulo circulo)
        {

            Console.WriteLine("Área: " + circulo.CalcularArea());
            Console.WriteLine("Comprimento: " + circulo.CalcularComprimento());
        }
    }
}
