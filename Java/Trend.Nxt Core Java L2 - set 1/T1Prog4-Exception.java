/*
Assignment 4:
Write and run AssertExample program to display below pattern with Assert disabled first and
then enabled [Note : Accept number of rows from user]
    *   
  *   *   
*   *   *   
  *   *   
    *   
And also Run the program without assertion so that you can catch user errors through exceptions.

If a user enters a negative value, throw a MyOwnNegativeValueEnteredException, which is an
extension of ArithmeticException. The display of the error information should display the
negative number that was entered.

If a user enters zero, throw a MyOwnZeroValueEnteredException, which is an extension
of ArithmeticException.
*/


import java.util.Scanner;

class MyOwnNegativeValueEnteredException extends ArithmeticException
{
	public MyOwnNegativeValueEnteredException()
	{
		super("Negative value is not a valid input.");
	}
}

class MyOwnZeroValueEnteredException extends ArithmeticException
{
	public MyOwnZeroValueEnteredException()
	{
		super("Zero value is not a valid input.");
	}
}

class Star2
{
    static void print(String str){
      System.out.print(str);
    }

    public static void main(String[] as) throws Exception
    {
	int rows,first,second;
	boolean oddRows;
	System.out.print("Enter no of rows:");
	Scanner S=new Scanner(System.in);
        
	try{
		rows = S.nextInt();	

		if(rows < 0)
			throw new MyOwnNegativeValueEnteredException();
		if(rows ==0)
			throw new MyOwnZeroValueEnteredException();

		first=second =(rows/2) ;
		oddRows=(rows%2==1);

		for(int r=1;r<=first;r++){

		    if(oddRows) print("  ");

		    for(int i=(first-r);i>0;i--)
		        print("  ");

		    for(int j=0;j<r;j++)
		        print("*   ");

		    print("\n");
		}

		if(oddRows) {	
			for(int i=0;i<first+1;i++)
				print("*   ");
			print("\n");
		}

		 for(int r=second;r>0;r--){

		    if(oddRows) print("  ");

		    for(int i=0;i<second-r;i++)
		        print("  ");

		    for(int j=r;j>0;j--)
		        print("*   ");

		    print("\n");
		}
	}
	catch(MyOwnNegativeValueEnteredException e){	
		e.printStackTrace();
	}
	catch(MyOwnZeroValueEnteredException e){
		e.printStackTrace();	
	}
    }
}
