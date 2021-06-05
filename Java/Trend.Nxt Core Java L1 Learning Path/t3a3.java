class Average 
{ 
public static void main(String args[]) 
{ 
double total=0; 
try 
{ 
if(args.length ==5) 
{ 
for(int i=0;i<args.length;i++) 
{ 
try 
{ 
double number=Integer.parseInt(args[i]); 
total = total + number; 
} 
catch(NumberFormatException e) 
{ 
System.out.println(" Invalid argument value"); 
} 
} 
System.out.println("Average:"+(total/args.length)); 
} 
} 
catch(ArrayIndexOutOfBoundsException e) 
{ 
System.out.println("Pls enter the required no of arguments"); 
} 
} 
} 