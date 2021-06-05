
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpArrays1
{
    class Program
    {
        static void Main(string[] args)
        {
            //determin if students are passed with marks as input
            int[] studentmarks;
            Console.WriteLine("Please enter the student marks");
            string marskinput = Console.ReadLine();
            string[] marks = marskinput.Split(' ');

            List<int> numList = new List<int>();
            if (new Program().fnValidate(marks) == 1)
            {
                foreach (string str in marks)
                {
                    int vresult;
                    Int32.TryParse(str.ToString(), out vresult);
                    numList.Add(vresult);
                }
                List<int> passedstudents = numList.Where(x => x >= 70).ToList();

                Console.WriteLine("Passed students list is given below");
                foreach (int num in passedstudents)
                {
                    Console.WriteLine("Marks :{0}", num);
                }
                Console.ReadLine();

                //sort the elements of an array in ascending order
                Console.WriteLine("The elements of the array in ascending order is given below");
                numList = numList.OrderBy(x => x).ToList();
                foreach (int num in numList)
                {
                    Console.WriteLine("Number equals {0}",num);
                }

                //implement 2D array
                int[,] array2D = new int[,] { { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 } };

                Console.WriteLine(" array2D[0][0] equals {0}", array2D[0, 0]);
                Console.WriteLine(" array2D[3][1] equals {0}", array2D[3, 1]);

                //implement jagged array
                int[][] jaggedarray = new int[3][];
                jaggedarray[0] = new int[2];
                jaggedarray[0][0] = 28;
                jaggedarray[0][1] = 200;

                jaggedarray[1] = new int[] {700 };
                jaggedarray[2] = new int[3];

                for (int i = 0; i < 3; i++)
                {
                    jaggedarray[2][i] = i;
                }

            }
            else
            {
                Console.WriteLine("The input is in incorrect format");
            }
            //List<int> passedstudents = numList.Where(x => x >= 70).ToList();

            //Console.WriteLine("Passed students list is given below");
            //foreach (int num in passedstudents)
            //{
            //    Console.WriteLine("Marks :{0}", num);
            //}
            Console.ReadLine();

            //sort the elements of an array in ascending order


        }

        int fnValidate(params object[] numbers)
        {

            foreach (object num in numbers)
            {
                int vresult;
                if (!Int32.TryParse(num.ToString(), out vresult))
                {
                    return 0;
                }
            }

            return 1;
        }
    }
}

