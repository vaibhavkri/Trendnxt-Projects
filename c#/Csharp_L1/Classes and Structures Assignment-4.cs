using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpAssignment4
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter the numbers separated by space");
            string numberlist = Console.ReadLine();
            string[] arrnums = numberlist.Split(' ');

            Console.WriteLine("Input numbers are given below");
            foreach (string s in arrnums)
            {
                Console.WriteLine("number equals {0}", s);
            }
            //Console.ReadLine();

            int result = new Program().fnValidate(arrnums);
            Console.WriteLine("Validation result equals {0}", result);

            if (result == 1)
            {
                new Program().fnMaxMin(arrnums);
                Console.WriteLine("The sum of digits are given below");
                new Program().fnSumOfDigits(arrnums);
            }

            Console.ReadLine();
        }

        int fnValidate(params object[] numbers)
        {

            foreach (object num in numbers)
            {
                int vresult;
                if (!Int32.TryParse(num.ToString(),out vresult))
                {
                    return 0;
                }
            }

            return 1;
        }


        void fnMaxMin(params object[] numbers)
        {
            List<int> numList = new List<int>();
            if (fnValidate(numbers) == 1)
            {
                foreach (object num in numbers)
                {
                    int vresult;
                    Int32.TryParse(num.ToString(), out vresult);
                    numList.Add(vresult);
                }
            }
            Console.WriteLine("The smallest number equals {0}", numList.OrderBy(n => n).ElementAt(0));
            Console.WriteLine("The largest number equals {0}", numList.OrderByDescending(n => n).ElementAt(0));
            Console.ReadLine();
        }

        void fnSumOfDigits(params object[] numbers)
        {
            List<int> numList = new List<int>();
            if (fnValidate(numbers) == 1)
            {
                foreach (object num in numbers)
                {
                    int vresult;
                    Int32.TryParse(num.ToString(), out vresult);
                    numList.Add(vresult);
                }
            }
            var numbersum=numList.Sum();
            Console.WriteLine("sum of numbers equals {0}", numbersum);

            int rem=0;
            int quotient = 0;
            int sumdigit = 0;
            do
            {
              quotient=  numbersum / 10;
              rem = numbersum % 10;
              numbersum = quotient;
              sumdigit += rem;
              if (sumdigit.ToString().Length > 1)
              {
                  numbersum = sumdigit;
                  sumdigit = 0;
              }
              else
              {
                 // Console.WriteLine("sum of digits equals {0}", sumdigit);
                 // Console.ReadLine();
              }
            } while (numbersum != 0);
            Console.WriteLine("sum of digits equals {0}", sumdigit);
            Console.ReadLine();
        }

    }
}
