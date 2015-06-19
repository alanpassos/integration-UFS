using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio4
{



   public class Circulo
    {
       double _raio;
       public void InsertData()
       {
           
           Console.WriteLine("Informe o Raio");
           _raio = Convert.ToDouble(Console.ReadLine());
       }

       public double CalcularArea()
       {
           return (Math.PI * (_raio * _raio));
       }
       public double CalcularComprimento()
       {
           return ((2 * Math.PI) * (_raio));
       }

    }
}
