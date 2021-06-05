package test; 
public class Foundation 
{ 
    private int var1 = 21; 
    default int var2 = 11; 
    protected int var3 = 121; 
    public int var4 = 221; 
    public void accessVars() 
    { 
        System.out.println(var1); 
        System.out.println(var2); 
        System.out.println(var3); 
        System.out.println(var4); 
    } 
} 

import test.Foundation; 
class Foundation1 extends Foundation 
{ 
    public static void main(String args[]) 
    { 
        Foundation c = new Foundation(); 
        c.accessVars(); 
    } 
} 