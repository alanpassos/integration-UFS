using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio5
{
    class Program
    {
        static void Main(string[] args)
        {
            Stack<int> pilha = new Stack<int>();

            pilha.Push(5);
            pilha.Push(7);
            pilha.Push(9);
            pilha.Push(4);
            pilha.Push(5);

            PrintData(pilha);

            Console.ReadKey();


        }

        private static void PrintData(Stack<int> pilha)
        {
            Console.WriteLine(pilha.Pop());
            foreach (int t in pilha)
            {
                Console.WriteLine(t);
            }
        }
    }
}
