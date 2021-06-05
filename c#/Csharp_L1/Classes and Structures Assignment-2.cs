Program.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            string first = "";
            string second = "";
            StringBuilder sb;

            Console.WriteLine("Please enter the first string");
            first = Console.ReadLine();

            Console.WriteLine("Please enter the second string");
            second = Console.ReadLine();

            string tempfirst = first;
            string tempsecond = second;

            int countfirst = first.ToCharArray().Where(x => x.Equals('a') || x.Equals('A')).Count();
            //Console.WriteLine("number of 'a' or 'A' in first equals {0}", countfirst);

            int countsecond = second.ToCharArray().Where(x => x.Equals('a') || x.Equals('A')).Count();
            //Console.WriteLine("number of 'a' or 'A' in second equals {0}", countsecond);

            Console.WriteLine("number of 'a' or 'A' in both the strings equals {0}", countfirst + countsecond);

            

            first = first.Replace('a', '@').Replace('A', '@');
            Console.WriteLine("first after transformation equals {0}", first);

            second = second.Replace('a', '@').Replace('A', '@');
            Console.WriteLine("second after transformation equals {0}", second);

            second = tempsecond;
            first = tempfirst;

            first = first.ToUpper();
            Console.WriteLine("first after converting to upper {0}", first);

            second = second.ToUpper();
            Console.WriteLine("second after converting to upper {0}", second);

            //second.Concat(first);

            Console.WriteLine("After concatinating result equals {0}", string.Concat(first,second));
            first = tempfirst;

            sb = new StringBuilder(first);
            string apdresult = sb.AppendFormat("-{0}", second).ToString();
            Console.WriteLine("Result after appending equals {0}", apdresult);

            sb = new StringBuilder(second);
            apdresult = sb.Insert(0, "BLR-").ToString();
            Console.WriteLine("Result after inserting equals {0}", apdresult);

            sb = new StringBuilder(second);
            apdresult = sb.Remove(0, 4).ToString();
            Console.WriteLine("Result after removal equals {0}", apdresult);
            
            sb = new StringBuilder(second);
            apdresult = sb.Replace('A', '@').ToString();
            Console.WriteLine("Result after replace equals {0}", apdresult);

            Console.ReadLine();
        }
    }
}
