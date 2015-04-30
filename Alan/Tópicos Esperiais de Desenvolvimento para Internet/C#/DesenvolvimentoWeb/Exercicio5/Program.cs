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
            List<int> lista = new List<int>();
            Queue<int> fila = new Queue<int>();
        
                
            InsertStack(pilha);

            InsertList(lista);

            InsertQueue(fila);


            Console.ReadKey();


        }

        private static void InsertQueue(Queue<int> fila)
        {
            fila.Enqueue(5);
            fila.Enqueue(4);
            fila.Enqueue(9);
            fila.Enqueue(7);
            fila.Enqueue(5);
            PrintData(fila);
        }

        private static void InsertList(List<int> lista)
        {


            lista.Add(5);
            lista.Add(4);
            lista.Add(9);
            lista.Add(7);
            lista.Add(5);

            PrintData(lista);
        }

        private static void InsertStack(Stack<int> pilha)
        {

            pilha.Push(5);
            pilha.Push(7);
            pilha.Push(9);
            pilha.Push(4);
            pilha.Push(5);

            PrintData(pilha);
        }

        private static void PrintData(Stack<int> pilha)
        {
            Console.WriteLine("Dados da Pilha");
            Console.WriteLine(pilha.Pop());
            foreach (int t in pilha)
            {
                Console.WriteLine(t);
            }
        }



        private static void PrintData(List<int> lista)
        {
            Console.WriteLine("Dados da Lista");

            foreach (int t in lista)
            {
                Console.WriteLine(t);
            }
        }
        private static void PrintData(Queue<int> fila)
        {
            Console.WriteLine("Dados da Fila");
            //Console.WriteLine(fila.Peek());


            foreach (int t in fila)
            {
                Console.WriteLine(t);
            }
        }
    }
}
