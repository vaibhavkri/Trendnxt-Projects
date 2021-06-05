import java.util.Collections; 
import java.util.HashSet; 
import java.util.Iterator; 

public class Main 
{ 
    public static void main(String args[]) 
    { 
        // create hash set 
        HashSet <String> newset = new HashSet <String>(); 
        // populate hash set 
        newset.add("Employee1"); 
        newset.add("Employee2"); 
        newset.add("Employee3"); 
        // create an iterator 
        Iterator iterator = newset.iterator(); 
        // check values 
        System.out.println("Retrieving values from HashSet using Iterator"); 
        while (iterator.hasNext()) 
        { 
            System.out.println("Emp Name: "+iterator.next() + " "); 
        } 
    } 
} 
