Employee.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpL1
{
    public class Employee
    {
        private static int m_Counter = 1000;

        private int empid;
        private string name;
        protected int salary;

        public int Salary { get; set; }
        public string Name { get; set; }
        public int EmpId
        {
            get
            {
               return empid ;
            }

            set
            {
                empid=value;
            }
        }

        public Employee()
        {
            empid=m_Counter++;
        }

        public Employee( string employeename, int empsalary)
        {
            //empid++;       
            Name = employeename;
            Salary = empsalary;
        }

        public virtual void ShowDetails(Employee emp)
        {
            Console.WriteLine("Id={0}, Name={1}, Salary={2}",emp.EmpId,emp.Name,emp.Salary);
        }

        
    }
}

Manager.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpL1
{
    public class Manager : Employee
    {
        private int travelallowance;

        public int TravelAllowance
        {
            get;
            set;
        }

        public Manager()
        {
        }

        public Manager(int TrAllowance)
        {
            TravelAllowance = TrAllowance;
        }

        public void ShowSalary(Manager mgr)
        {
            //display salary
            Console.WriteLine("Manager has salary equals :{0}",mgr.Salary);
        }

        public void ShowSalary()
        {
            Console.WriteLine("Manager has salary equals :{0}", Salary);
        }

        public void ShowTotalSalary(Manager mgr)
        {
            //display salary + travel allowance
            Console.WriteLine("Manager has total salary equals :{0}", mgr.Salary + mgr.TravelAllowance);
        }

        public override void ShowDetails(Employee emp)
        {
            //base.ShowDetails(emp);
            Manager mgr = emp as Manager;
            Console.WriteLine("Id={0}, Name={1}, Salary={2}, Travel Allowance={3}", mgr.EmpId, mgr.Name, mgr.Salary,mgr.TravelAllowance);
        }

    }
}

Program.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpL1
{
    class Program
    {
        static void Main(string[] args)
        {
            Employee emp1= new Employee();
            emp1.Name = "prabhas";
            emp1.Salary= 50000;
            
            Employee emp2 = new Employee();
            emp2.Name="udaykumar";
            emp2.Salary= 78000;

            Console.WriteLine("Details of employee1 are given below");
            emp1.ShowDetails(emp1);
            Console.WriteLine();

            Console.WriteLine("Details of employee2 are given below");
            emp2.ShowDetails(emp2);
            Console.WriteLine();

            Manager mgr = new Manager();
            mgr.Name = "Vinayak";
            mgr.Salary = 80000;
            mgr.TravelAllowance = 1000;
            Console.WriteLine("Details of manager are given below");

            mgr.ShowDetails(mgr);
            mgr.ShowSalary(mgr);
            //invoking overloaded showsalary
            Console.WriteLine("invoking overloaded showsalary");
            mgr.ShowSalary();

            mgr.ShowTotalSalary(mgr);
            Console.WriteLine();
            Console.ReadLine();
        }
    }
}

