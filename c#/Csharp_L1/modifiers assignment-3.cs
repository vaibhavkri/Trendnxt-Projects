Account.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers3
{
    class Account
    {
        string _Name;
        string _AccountNumber;
        string _AccountType;

        public string Name { get; set; }
        public string AccountNumber { get; set; }
        public string AccountType { get; set; }

    }
}

Current_Acc.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers3
{
    class Current_Acc :Account
    {
        double balance;
        int minimumBalance;
        int penalty;

        //Check for minimum balance, impose penalty, if necessary and update the balance. 
        public void CheckMinimumBalance()
        {
            if (balance < minimumBalance)
            {
                Console.WriteLine("Balance is less than minimum balance");
                balance -= penalty;
                Console.WriteLine("Balance after imposing penalty equals {0}", balance);
            }
        }
 
        //accept deposit and update the balance
        public void AcceptDeposit(double depositamount)
        {
            balance += depositamount;
        }

        //Permit withdrawal and update the balance
        public void Withdraw(int amt)
        {
            if (amt < balance)
            {
                balance = balance - amt;
                Console.WriteLine("Balance after withdrawal is {0}", balance);
            }
        }

        //display the balance
        public void displayBalance()
        {
            Console.WriteLine("Balance equals {0}", balance);
        }

    }
}

Savings_Acc.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSharpModifiers3
{

    class Savings_Acc : Account
    {
        double _balance;
        double r;//rate of interest
        int n;//no of years
        
        public double balance 
        {
            get
            {
                return _balance;
            }
            set
            {
                _balance=value;
            }
        }

        //accept deposit and update the balance
        public void AcceptDeposit(double depositamount)
        {
            balance += depositamount;
        }
        
        //display the balance
        public void displayBalance()
        {
            Console.WriteLine("Balance equals {0}", balance);
        }

        //compute and deposit interest
        public void ComputeInterest()
        {
            //(1+R/100)
            var temp = (r / 100) + 1;
            temp = Math.Pow(temp, n);
            balance = balance * temp;
            Console.WriteLine("Balance after depositing interest is {0}", balance);
        }

        //Permit withdrawal and update the balance
        public void Withdraw(int amt)
        {
            if (amt < balance)
            {
                balance = balance - amt;
                Console.WriteLine("Balance after withdrawal is {0}", balance);
            }
        }

         
    }
}
