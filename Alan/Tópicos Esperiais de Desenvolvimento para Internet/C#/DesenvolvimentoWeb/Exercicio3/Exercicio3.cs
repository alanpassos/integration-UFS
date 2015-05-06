using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio3
{
    class Exercicio3
    {
        static void Main(string[] args)
        {


            int firstNumber, lastNumber;

            Console.WriteLine("informe o primeiro numero");
            firstNumber = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("informe o ultimo numero");
            lastNumber = Convert.ToInt32(Console.ReadLine());

            PrintNumber(firstNumber, lastNumber);
            Console.ReadKey();

        }

        private static void PrintNumber(int firstNumber, int lastNumber)
        {
            Console.WriteLine("Números impressos");
            for (int i = (firstNumber + 1); i < lastNumber; i++)
            {
                Console.WriteLine(i);
            }
        }
    }
}
