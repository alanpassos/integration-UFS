using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio2
{
    class Program
    {
        static void Main(string[] args)
        {
            int numero1, numero2;

            Console.WriteLine("informe o promeiro número");
            numero1 =Convert.ToInt32( Console.ReadLine());
            Console.WriteLine("informe o Segundo número");
            numero2 = Convert.ToInt32(Console.ReadLine());


            PrintValue(numero1, numero2);
            Console.ReadKey();




        }

        private static void PrintValue(int numero1, int numero2)
        {
            Console.WriteLine("Soma: " + (numero1 + numero2));
            Console.WriteLine("Subtração: " + (numero1 - numero2));
            Console.WriteLine("Multiplicação: " + (numero1 * numero2));
            Console.WriteLine("Divisão: " + (numero1 / numero2));
            Console.WriteLine("Resto: " + (numero1 % numero2));
        }
    }
}
