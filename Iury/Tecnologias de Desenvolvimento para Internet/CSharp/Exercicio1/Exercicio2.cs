using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Exe2
    {
        static void Main(string[] args)
        {
            int numeroA, numeroB;

            Console.Write("Informe um valor para o número A: ");
            numeroA = Console.Read();
            Console.Write("Informe o valor para o número B: ");
            numeroB = Console.Read();

            Console.WriteLine("Soma de número A e número B: {0} ", numeroA + numeroB);
            Console.WriteLine("Subtração de número A e número B: {0}", numeroA - numeroB);
            Console.WriteLine("Multiplicação do número B pelo número A: {0}", numeroA * numeroB);
            Console.WriteLine("Divisão entre número A e número B: {0}", numeroA - numeroB);
        }
    }
}
