//Assignment Step 1

import java.util.Arrays;
import java.util.Scanner;
public class AssignmentStep1
{
	public static void main(String args[])
	{
		//Declaration
		String filename="";
		String base="";
		String filter="";
		int where=0;
		
		do
		{
		
		//Getting query
		System.out.println("Please Enter The Query :\n");
		Scanner sc = new Scanner(System.in);
		String query = sc.nextLine().toUpperCase();
		String[] Array1 = query.split(" ");
		String query2 ="";
		//If query is correct
		if(Array1[0].contains("SELECT"))
		{ 
		//a.   Printing the split
		System.out.println("Output Splited String : Displaying various components/parts\n ");
		for(int i=0; i< Array1.length ; i++)
		{
			System.out.println(Array1[i]);
		}
		for(int i=0; i< Array1.length ; i++)
		{
			
			if(Array1[i].contains("WHERE"))
			{
			where=i;
			String[] Array2 = query.split("WHERE");
			base=Array2[0].trim();
			filter=Array2[1].trim();
			break;
			}
			else
			{
			where=Array1.length ;
			base=query;
			filter="";
			}
		}
		//b.
		//1.    Printing filename
		System.out.println("\nFile Name :\t"+ Array1[where-1]);
		

		
		//2.	Printing base query
		System.out.println("Base Query :\t" + base);
		//3.	Printing filter query
		System.out.println("Filter Query :\t" +filter );
		
		
		
		if(filter.contains("OR") || filter.contains("AND") || filter.contains("NOT"))
		{

		//5.	Printing logical operator
		operator(filter);
		}
			
		//7.	Printing order_by field
		//8.	Printing group_by field
		if(filter.contains("ORDER BY")||filter.contains("GROUP BY"))
		{
			String orderby="";
			String groupby="";
			if(filter.indexOf("ORDER BY")>filter.indexOf("GROUP BY"))
			{
				String[] Array = filter.split("ORDER BY");
				orderby=Array[1].trim();
				String[] Array2 = Array[0].split("GROUP BY");
				groupby=Array2[1].trim();
				query2=Array2[0].trim();
			}
			else
				{
					String[] Array = filter.split("GROUP BY");
					groupby=Array[1].trim();
					String[] Array2 = Array[0].split("ORDER BY");
					orderby=Array2[1].trim();
					query2=Array2[0].trim();
				}
			
			System.out.println("Output ORDER BY Field String :\t"+orderby.trim());
			System.out.println("Output GROUP BY Field String :\t"+groupby.trim());

			
		}	
		//4.	Printing conditions
		conditions(query2);

		
		//9.	Printing aggregate function
		aggregate(base);
		
			

		//6.	Printing fields
		fields(base);
		


		
		
		
		break;
		}
		//If query is wrong
		else
		{
			System.out.println("\nPlease Enter Valid Select Query :\n ");		
		}
		}while(true);
	}
	
	
	public static void operator(String query) 
	{
		System.out.println("\nLogical Operators are :\t");
		String[] Array =query.split(" ");
		for(int i =0; i< Array.length; i ++) 
		{
			if(Array[i].equals("OR") || Array[i].equals("AND") || Array[i].equals("NOT")  )
			{

				System.out.println(Array[i]);
			}
		}
	}
		public static void aggregate(String query) 
	{
		System.out.println("\nAggregate Functions Fields are :\t");
		String[] Array= query.split("\\ |\\,");
		for(int i=1; i < Array.length-2; i++) 
			{
			if((Array[i].contains("MIN") || Array[i].contains("MAX") || Array[i].contains("COUNT")|| Array[i].contains("AVG")|| Array[i].contains("SUM")))
			{	
		System.out.println(Array[i]);
	}}
	}
	
	
		public static void fields(String query) 
	{
		if (query.contains("*"))
		{
			System.out.println("\nThe query contains * so it will have all the fields in that table.");
		}
		else
		{
			System.out.println("\nSelected Fields :\t");
			String[] Array= query.split("\\ |\\,");
			for(int i=1; i < Array.length-2; i++) 
				{
				if(!(Array[i].contains("MIN") || Array[i].contains("MAX") || Array[i].contains("COUNT")|| Array[i].contains("AVG")|| Array[i].contains("SUM")))
				{	
			System.out.println(Array[i]);
		}}
		}
	}
		public static void conditions(String query) 
	{
		System.out.println("\nConditional Parts Applied :\t");
		
		
		
		String[] Array =query.split("(\\sAND\\s|\\sOR\\s|\\sNOT\\s)");
		for(int i =0; i< Array.length; i ++) 
			{
				System.out.println(Array[i]);
			}
	
		}
	}
