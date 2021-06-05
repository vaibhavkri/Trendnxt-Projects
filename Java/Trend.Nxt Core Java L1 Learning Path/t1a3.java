import java.util.Scanner;
public class Main
{
	static int min;
	public static void main(String[] args) 
	{
		Scanner obj = new Scanner(System.in);
		System.out.println("Enter the time in minutes:");
		min = obj.nextInt();
		int year = min/(365*24*60);
		int x = min%(365*24*60);
		int day = x/(24*60);
		System.out.println(year+" year and "+day+" days");
		 
	}
}