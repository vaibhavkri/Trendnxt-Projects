public class Main
{ 
public static void main(String[] args) 
    { 
        String str = "This is an Example Of The Character"; 
        System.out.println("Length Of String:" + str.length()); 
        int x = str.replaceAll("a", "").length(); 
        int charcount = str.length() - x; 
        System.out.println("Occurrence Of A Char In String: " + charcount); 
    } 
} 
