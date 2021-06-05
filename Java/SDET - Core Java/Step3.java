//Assignment Step 3
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


public class AssignmentStep3 {
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
	    for(int i=0; i < header.length; i++) 
	      {
	    	if(row[i].matches("^[0-9]*$")) {
	        Integer value= Integer.valueOf(row[i]);
	    	System.out.println(header[i]+":"+value.getClass() );
	    	}
	    	else {
	    	System.out.println(header[i]+":"+row[i].getClass());
	    	}
	      }
		
		
	}
	
}