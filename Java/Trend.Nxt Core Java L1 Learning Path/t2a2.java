import java.util.*;
public class Main
{
    static int flag = 1;
    public static void main(String[] args)
    {
        while (true && flag<=11)
        {
            Calendar a = Calendar.getInstance();
            String wTime = "HH:MM:SS";

            String sec = Integer.toString(a.get(Calendar.SECOND));
            String min = Integer.toString(a.get(Calendar.MINUTE));
            String hour = Integer.toString(a.get(Calendar.HOUR_OF_DAY));
            String time = hour + ":" + min + ":" + sec;
            
            if(time == wTime)
            {
                
            }
            try 
            {
            
                    System.out.println(time);
                    Thread.sleep(2000);
                    flag++;
            
            }
            catch (InterruptedException e) 
            {
                e.printStackTrace();
            }
        }
    }
}