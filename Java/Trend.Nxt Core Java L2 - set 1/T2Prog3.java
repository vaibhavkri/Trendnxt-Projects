/*
Assignment 3:
Write a Java program to get year and months between two dates.
*/

import java.util.Date;
import java.text.SimpleDateFormat;

class DateDiff
{
    public static int HOUR_IN_DAY = 24;
    public static int SEC_IN_HOUR = 3600;
    public static int MILIS_IN_SEC = 1000;
    public static int DAYS_IN_MONTH = 30;
    public static int MONTHS_IN_YEAR = 12;
	
    public static void main(String[] as) throws Exception
    {
	Date d1=null,d2=null;

        String date1 = "11/02/15";
        String date2 = "20/09/18";

	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");

	d1 = sdf.parse(date1);
        d2 = sdf.parse(date2);

	long diff = d2.getTime() - d1.getTime();

	int diffIndays =  (int)(diff / (MILIS_IN_SEC * SEC_IN_HOUR * HOUR_IN_DAY));

	int diffInYear = diffIndays / (DAYS_IN_MONTH * MONTHS_IN_YEAR);

	int diffInMonths = (diffIndays%(DAYS_IN_MONTH * MONTHS_IN_YEAR))/DAYS_IN_MONTH;

	System.out.println("No of years:="+diffInYear);
	System.out.println("No of months:="+diffInMonths);
    }
}
