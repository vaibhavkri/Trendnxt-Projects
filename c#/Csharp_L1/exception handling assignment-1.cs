InvalidDivisorException.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpExceptionHandling1
{
    public class InvalidDivisorException : Exception
    {
        public InvalidDivisorException(string message) :base(message)
        {

        }
    }
}


Program.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpExceptionHandling1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(" Please enter the two numbers to divide");

            Console.WriteLine("Please enter number1");
            string numbr1 = Console.ReadLine();
            double num1;
            double.TryParse(numbr1, out num1);

            Console.WriteLine("Please enter number2");
            string numbr2 = Console.ReadLine();
            double num2;
            double.TryParse(numbr2, out num2);

            Division div = new Division(num1, num2);
            try
            {
              double result=  div.Divide();
              Console.WriteLine("{0}/{1} equals :{2}", num1, num2, result);
            }
            catch (InvalidDivisorException iex)
            {
                Console.WriteLine(iex.Message);
            }
            Console.ReadLine();
        }
    }
}

Divide.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpExceptionHandling1
{
    public class Division
    {
        double x;
        double y;

        public Division(double num1, double num2)
        {
            x = num1;
            y = num2;
        }


        public double Divide()
        {
            if (y == 0)
            {
                throw new InvalidDivisorException("The division operation cannot be done as the divisor is 0");
            }
            return x / y;
        }

    }
}
