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
*/
import java.util.Scanner;

class Star
{
    static void print(String str){
      System.out.print(str);
    }

    public static void main(String[] as)
    {
	int rows,first,second;
	boolean oddRows;
	System.out.print("Enter no of rows:");
	Scanner S=new Scanner(System.in);
        
	rows = S.nextInt();	
	assert rows>0: "Negative Number not Valid!";

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

	if(oddRows){	
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
}
