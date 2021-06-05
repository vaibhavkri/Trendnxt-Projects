public class Main { 
public static void main(String args[]){ 
if(args.length == 2) 
{ 
try 
{ 
int age = Integer.parseInt(args[0]); 
String name = args[1]; 
if(age>= 18 && age <60) 
System.out.println("Age of "+name+" is accepted for the class"); 
else 
System.out.println("Age of "+name +" is not in required range"); 
} 
catch(NumberFormatException e){ 
System.out.println("Your input is not a number"); 
}catch(ArrayIndexOutOfBoundsException e){ //if no input given 
System.out.println("Please enter the agruments on the command line"); 
} 
} 
else 
{ 
System.out.println("Pls enter required arguments"); 
} 
} 
} 