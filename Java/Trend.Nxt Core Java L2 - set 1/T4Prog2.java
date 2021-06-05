/*
Assignment 2 :
Create an interface WordCount with single abstract method int count(String str) to count no.of
words in a given string. Implement count(String str) method by using Lambda expression in an
implementation class MyClassWithLambda & invoke it to display the result on the console.
*/
import java.util.Scanner;

interface WordCount 
{
	int count(String str);
} 
  
class MyClassWithLambda 
{ 
    public static void main(String args[]) 
    { 
   
        WordCount wc =  (str) -> {

		int wcr=0;
		String[] wa = str.split(" ");

		for(String w:wa){	
			wcr += w.equals("")?0:1;					
		}
		return wcr;
	};  
	
	String str1;

	Scanner S=new Scanner(System.in);
	System.out.print("Enter String:");
	str1=S.nextLine();
        System.out.println("Word Count: "+wc.count(str1)); 
    } 
} 
