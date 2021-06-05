Compartment.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
    public abstract class Compartment
    {
        public abstract void notice();
        

    }
}

FirstClass.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
    public class FirstClass : Compartment
    {
        public override void notice()
        {
            Console.WriteLine("Notice of FirstClass compartment");
        }


    }
}

General.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
   public class General :Compartment
    {
        public override void notice()
        {
            Console.WriteLine("Notice of General compartment");
        }
    }
}

Ladies.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
    public class Ladies :Compartment
    {
        public override void notice()
        {
            Console.WriteLine("Notice of Ladies compartment");
        }
    }
}

Luggage.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
    public class Luggage :Compartment
    {
        public override void notice()
        {
            Console.WriteLine("Notice of luggage compartment");
        }
    }
}

Program.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays3
{
    class TestCompartment
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello from TestCompartment");
            Compartment[] compartments = new Compartment[10];
            Console.WriteLine("Please enter compartment type");
            string comptype=Console.ReadLine();

            switch (comptype)
            {
                case "1":
                    compartments[0] = new FirstClass();
                    compartments[0].notice();
                    break;
                case "2":
                    compartments[0] = new General();
                    compartments[0].notice();
                    break;
                case "3":
                    compartments[0] = new Ladies();
                    compartments[0].notice();
                    break;
                case "4":
                    compartments[0] = new Luggage();
                    compartments[0].notice();
                    break;
                default:
                    Console.WriteLine("invalid input format");
                    break;
            }

            Console.ReadLine();
        }
    }
}
