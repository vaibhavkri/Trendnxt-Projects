/*
Assignment 2:
Create a file named the Numbers and populate it with 30 random numbers in the range 1 to 30
including the end points. Place 1 number per line. Open the file and print the numbers 10 per
line Find and print the following.
1. Average of the numbers
2. Sum of the numbers
*/

import java.util.Random;
import java.util.Scanner;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.FileInputStream;
import java.io.InputStreamReader;

class Number
{
	int num;

	Number(int Number){
		num =Number;
	}

	static void PrintAll(Number[] pa){
			System.out.println(" Number");
			System.out.println("--------");

		for(int i=0;i<30;i++){
			System.out.printf("%2d ",pa[i].num);
			if((i+1)%10==0)
				System.out.println();
		}		
	}

	static void AddNumberToFile(String filename) throws IOException {

		BufferedWriter bw = new BufferedWriter(new FileWriter(filename));
			
		StringBuilder content=new StringBuilder();

		Random R=new Random();

		for(int i=0;i<30;i++){
			content.append(Math.abs(R.nextInt()%30)+1);
			content.append("\n");		
		}		

		bw.write(content.toString());
		bw.close();		
        }

	static void PrintAverage(Number[] pa){
		int sum=0;
		
		for(int i=0;i<30;i++){
			sum+=pa[i].num;
		}	
		System.out.println("Avg is:-"+(double)(sum/30));
	}

	static void PrintSum(Number[] pa){
		int sum=0;
		
		for(int i=0;i<30;i++){
			sum+=pa[i].num;
		}	
		System.out.println("Sum is:-"+sum);
	}


	static Number[] ReadFileContents(String filename) throws IOException {

		FileInputStream fin = new FileInputStream(filename);
		Number[] pr= new Number[30];

		BufferedReader br =new BufferedReader(new InputStreamReader(fin));

		String line = br.readLine();
		int i=0;
		while (line != null) {
			pr[i++]=new Number(Integer.parseInt(line));
			line = br.readLine();
		}
		br.close();
		return pr;
	}
}


class NumberFile
{
   public static void main(String args[]) throws IOException 
   {    
	Number.AddNumberToFile("Number.txt");

	Number[] pa = Number.ReadFileContents("Number.txt");

	Scanner sc=new Scanner(System.in);

	Number.AddNumberToFile("Number.txt");

	Number.PrintAll(pa);

	while(true){
		System.out.println();
		System.out.println("1. Average of the numbers");
		System.out.println("2. Sum of the numbers");
		System.out.println("3. Print all the numbers");
		System.out.println("4. Exit");

		int choice=sc.nextInt();

		switch(choice){
			
			case 1: Number.PrintAverage(pa);break;
			case 2: Number.PrintSum(pa);break;
			case 3: Number.PrintAll(pa); break;
			default:
				 System.exit(0); break;
		}
	}
   }
}


    
