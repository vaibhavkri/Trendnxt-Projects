InvalidAgeException.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpExceptionHandling2
{
    class InvalidAgeException :Exception
    {
        public InvalidAgeException(string message)
            : base(message)
        {
        }
    }
}

Program.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpExceptionHandling2
{
    class Program
    {
        static void Main(string[] args)
        {
            string name;
            string age;
            
            Console.WriteLine("Enter the name of the person");
            name = Console.ReadLine();

            Console.WriteLine("Enter the age of the person");
            age = Console.ReadLine();

            int iage;
            if (int.TryParse(age, out iage))
            {
                try
                {
                    if (iage >= 18 && iage < 60)
                    {
                        Console.WriteLine("Thank you for entering correct data");
                    }
                    else
                    {
                        throw new InvalidAgeException("Age should be greater than equals 18 and less than 60");
                    }
                }
                catch (InvalidAgeException iex)
                {
                    Console.WriteLine(iex.Message);
                }
            }
            else
            {
                Console.WriteLine("age is in invalid format");
            }

            Console.ReadLine();
        }
    }
}
