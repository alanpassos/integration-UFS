using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Por favor, informe o seu nome: ");
            string nome = Console.ReadLine();

            Console.WriteLine("Seu nome é {0}", nome);
            Console.ReadKey();
        }
    }
}
