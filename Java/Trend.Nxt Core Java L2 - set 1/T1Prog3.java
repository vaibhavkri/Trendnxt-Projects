/*
Assignment 3:
Write a java program to create enum type all the days of the week and a method that prints a
String corresponding to the day value that passed in as argument.[Hint: Use Switch Case]
*/

import java.util.Random;

class Week
{

    enum Days {
        Mon,Tue,Wed,Thu,Fri,Sat,Sun
    }


    public static void main(String[] as)
    {
      Days days;
      
      Random random=new Random();
      
      days= Days.values()[Math.abs(random.nextInt() % Days.values().length)];
      
      switch (days)
      {

          case Mon:
              System.out.println("Monday");
              break;
          case Tue:
              System.out.println("Tueday");
              break;
          case Wed:
              System.out.println("Wednesday");
              break;
          case Thu:
              System.out.println("Thursday");
              break;
          case Fri:
              System.out.println("Friday");
              break;
          case Sat:
              System.out.println("Saturday");
              break;
          case Sun:
              System.out.println("Sunday");
              break;
      }
    }
}
