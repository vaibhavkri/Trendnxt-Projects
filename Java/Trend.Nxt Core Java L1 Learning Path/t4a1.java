class A implements Runnable
    {
	    public void run()
	    {
		
		    for(int i=0;i<5;i++)
		    {
		        int random = (int)(Math.random() * 50 + 1);
		        //int no = random;
		        System.out.println("Random no:"+random);
		    }
	    }
    }


class B extends A

{
    public void run()
    {  
      int i,fact=1;  
      int number=random;    
      for(i=1;i<=number;i++)
      {    
          fact=fact*i;    
      }    
      System.out.println("Factorial of "+number+" is: "+fact);    
    }  
}

public class Main
{
    public static void main(String args[])
    {
        A obj1 = new A();
        B obj2 = new B();
        obj2.run();
        
    }
}
