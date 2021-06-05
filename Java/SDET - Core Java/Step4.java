//Assignment Step 4
import java.util.Objects;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;


public class AssignmentStep4 {
	private static String[] head;
	private static String[] body;

	public static void main(String[] args)throws IOException  {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System. in)	;
		System.out.println("Please Enter The File Name with full path : ");
		String fileName= scanner.nextLine();
		scanner.close();
		readCsv(fileName);
	    
	}
public static void readCsv(String file) throws IOException {
		
		File input= new File(file);
		InputStream inputStream = new FileInputStream(input);
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		reader.lines().forEach(string-> {if(string.indexOf("id")==0) {
			head=string.split(",");
		}
		else {
			body=string.split(",");
		}
		});
		
		reader.close();
		
		String[] header= head;
	    String[] row= body;
	    try {
	    for(int i=0; i < header.length-1; i++) 
	      {
	    	
	    	if(row[i].matches("^[0-9]*$")) {
	    		Integer value= Integer.valueOf(row[i]);
	    		System.out.println(header[i]+":"+value.getClass() );
	    	 }
	    	 else if(row[i].matches("([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"))
	    	 {
	    		 Date date = Date.valueOf(row[i]);
	    		 java.util.Date javaDate= new java.util.Date(date.getTime());
	    		 System.out.println(header[i]+":"+javaDate.getClass() );
	    		 
	    	 }
	    	
	    	 else {
	    		 System.out.println(header[i]+":"+row[i].getClass());
	    		 
	    	 }
	    	}
	      }finally {
	    	  System.out.println(header[header.length-1]+":class java.lang.Object");
	      }
	    
		
	      
	}
	
}