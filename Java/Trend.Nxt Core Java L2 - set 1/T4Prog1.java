/*
Assignment 1:
Create an interface CharacterOccurrence with int findOccurence(String str, char c) to find
no.of occurrences of a given character within the given string. Implement findOccurence(String
str, char c) method by using Lambda expression in an implementation class
ImplClassWithLambda & invoke it to display the result on the console. [Hint: str=”How was
your day today?” & c=’a’ the no.of occurrences of ‘a’ will be 3]
*/
import java.util.Scanner;

interface CharacterOccurrence 
{
	int findOccurence(String str, char c);
} 
  
class ImplClassWithLambda 
{ 
    public static void main(String args[]) 
    { 
   
        CharacterOccurrence cobj =  (str,ch) -> {

		int ocr=0;
		char[] ca = str.toCharArray();

		for(char c:ca){	
			ocr += (ch==c)?1:0;					
		}
		return ocr;
	};  
	
	String str1;
	char c1;

	Scanner S=new Scanner(System.in);
	System.out.print("Enter String:");
	str1=S.nextLine();
	System.out.print("Enter Character:");
	c1=S.next().charAt(0);

        System.out.println("No of charactor:"+cobj.findOccurence(str1,c1)); 
    } 
} 
