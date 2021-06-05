Employee.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers2
{
    class Employee
    {

        List<EmployeeEntity> emplist = new List<EmployeeEntity>
        {
            new EmployeeEntity { code=111,dept="Accounts",name="Keith"},
            new EmployeeEntity { code=112,dept="HR",name="Lee"},
            new EmployeeEntity { code=113,dept="Sales",name="Mark"}
        };

        //display all employees
        public void fnDisplay()
        {
            foreach (EmployeeEntity employee in emplist)
            {
                Console.WriteLine("Name={0}, Dept={1}, Code={2}",employee.name,employee.dept,employee.code);
            }
        }
        
        //display employees based on code
        public void fnDisplay(int code)
        {
            EmployeeEntity employee = emplist.Where(x => x.code.Equals(code)).FirstOrDefault();
            Console.WriteLine("Employee with code equals {0} is given below", code);
            Console.WriteLine("Name={0}, Dept={1}, Code={2}", employee.name, employee.dept, employee.code);

        }

        //display employees based on dept
        public void fnDisplay(string dept)
        {
            Console.WriteLine("Employee(s) with department equals {0} is given below", dept);
            var employeelist = emplist.Where(e => e.dept.Equals(dept));

            foreach (EmployeeEntity employee in employeelist)
            {
                Console.WriteLine("Name={0}, Dept={1}, Code={2}", employee.name, employee.dept, employee.code);
            }
        }
    }
}

EmployeeEntity.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers2
{
    public class EmployeeEntity
    {
       public int code;
        public string dept;
        public string name;


    }
}

Program.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers2
{
    class Program
    {
        static void Main(string[] args)
        {
            Employee empl = new Employee();
            empl.fnDisplay();
            Console.WriteLine();
            
            empl.fnDisplay(111);
            Console.WriteLine();
            
            empl.fnDisplay("HR");
            Console.WriteLine();

            Console.ReadLine();
        }
    }
}
